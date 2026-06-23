import 'package:flutter/material.dart';

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Center(
        child: SingleChildScrollView( // Agregado para que no haya error de pantalla al abrir el teclado
          child: Container(
            width: 300,
            child: formulario(context),
          ),
        ),
      ),
    );
  }
}

Widget formulario(BuildContext context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController nick = TextEditingController();
  TextEditingController edad = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/icons/img1.png',
        height: 120, // Agregamos la imagen aquí
      ),
      const SizedBox(height: 20),
      TextField(
        controller: correo,
        decoration: const InputDecoration(hintText: "Correo"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: contrasenia,
        obscureText: true,
        decoration: const InputDecoration(hintText: "Contraseña"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: nick,
        decoration: const InputDecoration(hintText: "Nick"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: edad,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: "Edad"),
      ),
      const SizedBox(height: 20),
      FilledButton.icon(
        onPressed: () => Navigator.pushNamed(context, "/login"),
        label: const Text("Registrarse"),
        icon: const Icon(Icons.save),
      ),
    ],
  );
}