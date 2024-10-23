import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/note_view.dart';
import 'viewmodel/note_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteViewModel()..fetchNotes(),
      child: MaterialApp(
        title: 'Flutter MVVM Notes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NoteView(),
      ),
    );
  }
}