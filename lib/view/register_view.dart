import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/user_viewmodel.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context
                    .read<UserViewModel>()
                    .registerUser(_usernameController.text, _passwordController.text);
                     // Mostrar SnackBar al registrar con éxito
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Usuario registrado con éxito')),
                );
                Navigator.pop(context);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
