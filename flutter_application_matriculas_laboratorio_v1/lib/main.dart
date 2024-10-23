import 'package:flutter/material.dart';
import 'package:flutter_application_matriculas_laboratorio_v1/pages/page02.dart';
import 'package:flutter_application_matriculas_laboratorio_v1/pages/page03.dart';
import 'package:flutter_application_matriculas_laboratorio_v1/pages/page04.dart';

// Material patron de diseño de google
void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Titulo de mi app",
      home: MyHomePage(), // widget para el home
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
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/vector-gratis/ilustracion-noche-verano-acuarela-columpio-arbol_23-2149459683.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1728604800&semt=ais_hybrid-rr-similar"),
            fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          nombre(),
          campoUsuario(),
          campoContrasena(),
          botonEntrar(context),
          botonIngresar(context),
          botonPagina03(context),
          botonPagina04(context),
        ],
      ),
    ),
  );
}

Widget nombre() {
  return const Text(
    "Sing in",
    style: TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget campoUsuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "user",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget botonEntrar(context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4)),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    },
    child: Text("Login - NavBar"),
  );
}

Widget botonIngresar(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
    ),
    onPressed: () => {
      debugPrint("presionaste el boton"),
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page02()),
      ),
    },
    child: Text("Pagina 02"),
  );
}

Widget botonPagina03(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
    ),
    onPressed: () => {
      debugPrint("presionaste el boton"),
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page03()),
      ),
    },
    child: Text("Pagina 03"),
  );
}

Widget botonPagina04(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
    ),
    onPressed: () => {
      debugPrint("presionaste el boton"),
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page04()),
      ),
    },
    child: Text("Pagina 04"),
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
    Page03(), // Contactos
    Page04(), // Imágenes
  ];

  // Títulos para cada página
  final List<String> _titulos = [
    'Página 01', // Título para Page02
    'Página 02', // Título para Page03
    'Página 03', // Título para Page04
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulos[_pagActual]),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            label: 'Términos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone), // Ícono para contactos
            label: 'Contactos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image), // Ícono para imágenes
            label: 'Imágenes',
          ),
        ],
      ),
    );
  }
}
