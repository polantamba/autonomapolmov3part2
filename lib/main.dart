import 'package:app_12/screen/LeerScreen.dart';
import 'package:app_12/screen/Welcome.dart';
import 'package:flutter/material.dart';

import 'screen/LoginScreen.dart';
import 'screen/RegistroScreen.dart';
import 'screen/GuardarScren.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const AppFire());
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/guardar",
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => const WelcomeScreen(),
        "/login": (context) => const Loginscreen(),
       "/registro": (context) => const Registroscreen(),
        "/guardar": (context) => const Guardarscreen(),
       "/leer": (context) => const Leerscreen(),
      },
    );
  }
}