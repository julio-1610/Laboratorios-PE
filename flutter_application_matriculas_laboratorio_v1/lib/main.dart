// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_matriculas_laboratorio_v1/src/viewmodel/home_page.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matricula Labs",
      home: MyHomePage(),
    );
  }
}
