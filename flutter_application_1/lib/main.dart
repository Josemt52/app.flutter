import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/foro_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';  // Agregar la pantalla de login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foro Ciudadano',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,  // Fondo negro para toda la app
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),  // Actualizado
          bodyMedium: TextStyle(color: Colors.white, fontSize: 14), // Actualizado
          headlineLarge: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), // Actualizado
          headlineMedium: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold), // Actualizado
          headlineSmall: TextStyle(color: Colors.white, fontSize: 18),  // Actualizado
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue, // Botones con fondo azul
        ),
      ),
      home: LoginScreen(),  // Pantalla de login
    );
  }
}
