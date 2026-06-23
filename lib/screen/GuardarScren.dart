import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: formulario(context));
  }
}
 
Widget formulario(context) {
  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();
 
  return (Center(
    child: Container(
      width: 350,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: placa),
          TextField(controller: marca),
          TextField(controller: precio),
 
          ElevatedButton(onPressed: () => guardar(context, placa, marca, precio), child: Text("Guardar")),

          OutlinedButton(onPressed: () => Navigator.pushNamed(context, "/leer"), child: Text("leer"))
        ],
      ),
    ),
  ));
}

Future<void> guardar (context, marca, placa, precio) async {
DatabaseReference ref = FirebaseDatabase.instance.ref("autos/${placa.text}");

await ref.set({
  "marca": marca.text,
  "precio":double.parse(precio.text)
  });
}
