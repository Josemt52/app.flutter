import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Fondo negro para el perfil
      appBar: AppBar(
        title: Text('Mi Perfil'),
        backgroundColor: Colors.black,  // Fondo negro en el AppBar
      ),
      body: Center(
        child: Container(
          color: Colors.black,  // Fondo negro
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://www.example.com/avatar.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  'Nombre del Usuario',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'Descripción breve del usuario o su actividad.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
