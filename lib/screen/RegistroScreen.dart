import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // IMPORTANTE: Los controladores se quedan aquí para que no se reinicien al escribir
    TextEditingController correo = TextEditingController();
    TextEditingController contrasenia = TextEditingController();
    TextEditingController nick = TextEditingController();
    TextEditingController edad = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 300,           child: formulario(context, correo, contrasenia, nick, edad),
          ),
        ),
      ),
    );
  }
}


Widget formulario(BuildContext context, TextEditingController correo, TextEditingController contrasenia, TextEditingController nick, TextEditingController edad) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/icons/img1.png',
        height: 120,
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
        // CORRECCIÓN: Ahora el botón ejecuta tu función de registro
        onPressed: () => registro(context, correo, contrasenia), 
        label: const Text("Registrarse"),
        icon: const Icon(Icons.save),
      ),
    ],
  );
}


Future<void> registro(BuildContext context, TextEditingController correo, TextEditingController contrasenia) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: correo.text, 
      password: contrasenia.text,
    );


    if (context.mounted) {
      Navigator.pushNamed(context, "/guardar");
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');

      showDialog(context: context, builder: (context) => 
      AlertDialog(
        title: Text("ERROR"),
        content: Text("El correo ya está en uso"),
      ),);
    }
  } catch (e) {
    print(e);
  }
}