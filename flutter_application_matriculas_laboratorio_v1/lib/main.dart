import 'package:flutter/material.dart';
import 'package:flutter_application_matriculas_laboratorio_v1/pages/page02.dart';

import 'package:flutter_application_matriculas_laboratorio_v1/pages/page04.dart';
import 'package:flutter/services.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matricula Labs",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(BuildContext context) {
  return Column(
    children: [
      // Cabecera
      Container(
        color: const Color.fromARGB(255, 97, 3, 3),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkKGnYpNgEG4POueCPXV_RNQ42tSzTS0kHv4IYZKneE8lwBr0H26iwkUZKbHwcgpUlrLU&usqp=CAU', // URL del logo de UNSA
                  height: 70,
                ),
                const SizedBox(width: 10),
                const Text(
                  "MATRICULAS LABS - 2024",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Formulario
      Expanded(
        child: Center(
          child: SingleChildScrollView(
            // Añadido para evitar el overflow
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "INGRESO DEL ALUMNO",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 97, 3, 3),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.network(
                    'https://images.emojiterra.com/microsoft/fluent-emoji/1024px/1f512_color.png', // Aquí puedes cambiar por tu imagen
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  campoUsuario(),
                  const SizedBox(height: 10),
                  campoContrasena(),
                  const SizedBox(height: 20),
                  botonAceptar(context),
                ],
              ),
            ),
          ),
        ),
      ),

      // Footer
      Container(
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          "Universidad Nacional de San Agustín de Arequipa",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ),
    ],
  );
}

Widget campoUsuario() {
  return TextField(
    decoration: InputDecoration(
      labelText: "Ingrese su Usuario",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
  );
}

Widget campoContrasena() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: "Ingrese su contraseña",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
  );
}

Widget botonAceptar(context) {
  return ElevatedButton.icon(
    icon: const Icon(Icons.lock),
    label: const Text("Aceptar"),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      iconColor: Color.fromARGB(255, 248, 248, 248),
      backgroundColor: const Color.fromARGB(255, 97, 3, 3),
      foregroundColor: Colors.white,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    },
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pagActual = 0;

  // Listado de páginas
  final List<Widget> _paginas = [
    Page02(), // Términos y condiciones

    Page04(), // Imágenes
  ];

  // Títulos para cada página
  final List<String> _titulos = [
    'Perfil de Usuario', // Título para Page02
    'Incripcion de Laboratorios', // Título para Page03
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titulos[_pagActual],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 97, 3, 3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Regresar a la página de inicio
            Navigator.pop(context);
          },
        ),
      ),
      body: _paginas[_pagActual], // Muestra la página según el índice actual
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pagActual,
        onTap: (index) {
          setState(() {
            _pagActual = index; // Cambia el índice actual
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.description), // Ícono para términos y condiciones
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image), // Ícono para imágenes
            label: 'Inscripcion',
          ),
        ],
      ),
    );
  }
}
