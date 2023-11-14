import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/firebase/email_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final conName = TextEditingController();
  final conEmailUser = TextEditingController();
  final conPassUser = TextEditingController();
  final emailAuth = EmailAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register a user')),
      body: Column(
        children: [
          TextFormField(
            controller: conName,
          ),
          TextFormField(
            controller: conEmailUser,
          ),
          TextFormField(
            controller: conPassUser,
          ),
          ElevatedButton(
              onPressed: () {
                var email = conEmailUser.text;
                var pass = conPassUser.text;
                emailAuth.createUser(emailUser: email, pwdUser: pass);
              },
              child: Text("Guardar")),
        ],
      ),
    );
  }
}
