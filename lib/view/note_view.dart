import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/note_viewmodel.dart';
import '../data/models/note_model.dart';

class NoteView extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Consumer<NoteViewModel>(
        builder: (context, noteViewModel, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: noteViewModel.notes.length,
                  itemBuilder: (context, index) {
                    final note = noteViewModel.notes[index];
                    return ListTile(
                      title: Text(note.title ?? 'No title'),
                      subtitle: Text(note.content ?? 'No content'),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: _contentController,
                      decoration: InputDecoration(labelText: 'Content'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final newNote = Note(
                          title: _titleController.text,
                          content: _contentController.text,
                        );
                        context.read<NoteViewModel>().addNote(newNote);
                        _titleController.clear();
                        _contentController.clear();

                       // Mostrar SnackBar al guardar una nota
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Nota guardada: ${newNote.title}')),
                         ); 
                      },
                      child: Text('Add Note'),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
