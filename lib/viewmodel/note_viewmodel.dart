import 'package:flutter/material.dart';
import '../data/models/note_model.dart';
import '../data/repositories/note_repository.dart';

class NoteViewModel extends ChangeNotifier {
  final NoteRepository _repository = NoteRepository();
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    _notes = await _repository.getNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await _repository.insertNote(note);
    fetchNotes();
  }
}