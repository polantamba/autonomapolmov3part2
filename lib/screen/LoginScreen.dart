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
        onPressed: () => Navigator.pushNamed(context, "/guardar"),
        label: const Text("Login"),
        icon: const Icon(Icons.login),
      ),
    ],
  );
}