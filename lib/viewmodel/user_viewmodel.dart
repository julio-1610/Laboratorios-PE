import 'package:flutter/material.dart';
import '../data/models/user_model.dart';
import '../data/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _repository = UserRepository();
  User? _currentUser;

  User? get currentUser => _currentUser;

  // Método para registrar un usuario
  Future<void> registerUser(String username, String password) async {
    final user = User(username: username, password: password);
    await _repository.insertUser(user);
    notifyListeners();
  }

  // Método para loguear un usuario
  Future<bool> loginUser(String username, String password) async {
    final user = await _repository.loginUser(username, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;  // Login exitoso
    }
    return false;  // Login fallido
  }
}
