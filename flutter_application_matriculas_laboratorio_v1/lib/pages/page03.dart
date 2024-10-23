import 'package:flutter/material.dart';

class Page03 extends StatefulWidget {
  Page03({super.key});

  @override
  State<Page03> createState() => _Page03State();
}

class _Page03State extends State<Page03> {
  List<Persona> _personas = [
    Persona("JOSE", "aaa", "147852"),
    Persona("MARIA", "bbbb", "3696369"),
    Persona("ANDY", "aaa", "147852"),
    Persona("BRIYIT", "bbbb", "3696369"),
    Persona("JULIO", "aaa", "147852"),
    Persona("GERARDO", "bbbb", "3696369"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Pagina 03"),
      //),
      body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                this._borrarPersona(context, _personas[index]);
              },
              title:
                  Text(_personas[index].name + ' ' + _personas[index].lastname),
              subtitle: Text(_personas[index].phone),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0, 1)),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          }),
    );
  }

  _borrarPersona(context, Persona persona) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Eliminar contacto"),
        content:
            Text("¿Estas seguro de eliminar al contacto " + persona.name + '?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar")),
          TextButton(
              onPressed: () {
                print(persona.name);
                this.setState(() {
                  _personas.remove(persona);
                });
                Navigator.pop(context);
              },
              child: Text("Borrar")),
        ],
      ),
    );
  }
}

class Persona {
  String name = '';
  String lastname = '';
  String phone = '';

  Persona(n, l, p) {
    name = n;
    lastname = l;
    phone = p;
  }
}
