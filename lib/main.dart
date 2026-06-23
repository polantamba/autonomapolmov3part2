import 'package:app_12/screen/Welcome.dart';
import 'package:flutter/material.dart';

import 'screen/LoginScreen.dart';
import 'screen/RegistroScreen.dart';
import 'screen/GuardarScren.dart';
import 'screen/LeerScreen.dart';

void main() {
  runApp(const AppFire());
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => const WelcomeScreen(),
        "/login": (context) => const Loginscreen(),
       "/registro": (context) => const Registroscreen(),
        "/guardar": (context) => const Guardarscreen(),
       // "/leer": (context) => const Leerscreen(),
      },
    );
  }
}