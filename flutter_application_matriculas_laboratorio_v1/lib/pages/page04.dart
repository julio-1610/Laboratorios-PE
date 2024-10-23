import 'package:flutter/material.dart';
import 'package:flutter_application_matriculas_laboratorio_v1/models/gif.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Para decodificar la respuesta JSON

class Page04 extends StatefulWidget {
  const Page04({super.key});

  @override
  State<Page04> createState() => _Page04State();
}

class _Page04State extends State<Page04> {
  Future<List<Gif>>? _listadoGif;

  Future<List<Gif>> _getGifs() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=3QMaQbiYhCQqg02jOCj7IizORuS70zOp&limit=10&offset=0&rating=g&bundle=messaging_non_clips"));

    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      // Decodificamos el JSON
      String body =
          utf8.decode(response.bodyBytes); // me asegura la decodificacion

      final jsonData = jsonDecode(body);

      print(jsonData["data"]);
      for (var item in jsonData["data"]) {
        gifs.add(
          Gif(item["title"], item["images"]["fixed_height_small"]["url"]),
        );
      }

      return gifs;
      // Mapeamos los datos a objetos Gif
    } else {
      throw Exception("Fallo conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGif = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Pagina 04"),
      //),
      body: FutureBuilder(
        future: _listadoGif,
        builder: (context, snapshot) {
          // Verifica si el Future está en proceso de carga

          // Si el Future tiene datos
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: _listadoDeGif(snapshot.data!),
            );
          }
          // Si ocurrió un error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          // Si el snapshot no tiene datos ni error, algo falló
          return Center(
            child: CircularProgressIndicator(),
          ); // Muestra un indicador de carga // Este return es por seguridad para manejar cualquier otro caso
        },
      ),
    );
  }

  List<Widget> _listadoDeGif(List<Gif> data) {
    List<Widget> gifs = [];

    for (var item in data) {
      gifs.add(
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Asegura que el contenido ocupe todo el ancho
            children: [
              // El contenedor para asegurarnos que la imagen ocupa todo el ancho
              Expanded(
                child: Image.network(
                  item.url,
                  fit: BoxFit
                      .cover, // Ajusta la imagen para cubrir todo el espacio
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Centra el texto
                ),
              ),
            ],
          ),
        ),
      );
    }

    return gifs;
  }
}
