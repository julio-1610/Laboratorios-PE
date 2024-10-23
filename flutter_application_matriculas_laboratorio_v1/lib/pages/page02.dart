import 'package:flutter/material.dart';

class Page02 extends StatefulWidget {
  const Page02(
      {super.key}); // Asegúrate de usar `const` y no inicializar variables innecesariamente.

  @override
  State<Page02> createState() => _Page02State();
}

class _Page02State extends State<Page02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Pagina 02"),
      //),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Términos y condiciones",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vestibulum id ligula porta felis euismod semper. Cras justo odio, "
              "dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vestibulum id ligula porta felis euismod semper. Cras justo odio, "
              "dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vestibulum id ligula porta felis euismod semper. Cras justo odio, "
              "dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vestibulum id ligula porta felis euismod semper. Cras justo odio, "
              "dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vestibulum id ligula porta felis euismod semper. Cras justo odio, "
              "dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vestibulum id ligula porta felis euismod semper. Cras justo odio, "
              "dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Vestibulum id ligula porta felis euismod semper. Cras justo odio, "
              "dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () => {Navigator.pop(context)},
                child: const Text("Presiona")),
          ],
        ),
      ),
    );
  }
}
