import 'package:flutter/material.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guardar")),
      body: Center(
        child: SingleChildScrollView(
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
  TextEditingController id = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController placa = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController marca = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: id,
        decoration: const InputDecoration(hintText: "ID"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: nombre,
        decoration: const InputDecoration(hintText: "Nombre"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: placa,
        decoration: const InputDecoration(hintText: "Placa"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: color,
        decoration: const InputDecoration(hintText: "Color"),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: marca,
        decoration: const InputDecoration(hintText: "Marca"),
      ),
      const SizedBox(height: 20),
      FilledButton.icon(
        onPressed: () => Navigator.pushNamed(context, "/leer"),
        label: const Text("Guardar"),
        icon: const Icon(Icons.save),
      ),
    ],
  );
}