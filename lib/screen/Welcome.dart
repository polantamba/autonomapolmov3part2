import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'), // Asegúrate de que la ruta sea correcta
            fit: BoxFit.cover, // Esto hace que la imagen cubra toda la pantalla
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/login"),
                child: const Text("Login"),
              ),
              FilledButton(
                onPressed: () => Navigator.pushNamed(context, "/registro"),
                child: const Text("Registro"), 
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, "/guardar"),
                child: const Text("Guardar"), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}