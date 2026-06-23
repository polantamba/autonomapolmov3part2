import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container( // Corregido: era child, no widthFactor
          width: 300,
          child: formulario(context), // Se pasa el context para la navegación
        ),
      ),
    );
  }
}

Widget formulario(BuildContext context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: correo, // Controladores asignados
        decoration: const InputDecoration(hintText: "Correo"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: contrasenia, // Controladores asignados
        obscureText: true,
        decoration: const InputDecoration(hintText: "Contraseña"),
      ),
      const SizedBox(height: 20),
      FilledButton.icon(
        onPressed: () => login(context, correo, contrasenia),
        label: const Text("Login"),
        icon: const Icon(Icons.login),
      ),
    ],
  );
}

Future<void> login(context, correo, contrasenia) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: correo.text,
    password: contrasenia.text
  );
    Navigator.pushNamed(context, "/guardar");
    
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');

  }else{
    showDialog(context: context, builder: (context) => 
      AlertDialog(
        title: Text("ERROR"),
        content: Text("El correo ya está en uso"),
      ),);
  }
}
}