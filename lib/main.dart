import 'package:flutter/material.dart';
import 'package:notas_fluter/view/login_view.dart';
import 'package:provider/provider.dart';
import 'viewmodel/user_viewmodel.dart';
import 'viewmodel/note_viewmodel.dart';  // Asegúrate de importar el NoteViewModel

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),  // Proveedor para UserViewModel
        ChangeNotifierProvider(create: (context) => NoteViewModel()),  // Proveedor para NoteViewModel
      ],
      child: MaterialApp(
        title: 'Flutter MVVM Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginView(),  // Iniciar con la pantalla de login
      ),
    );
  }
}
