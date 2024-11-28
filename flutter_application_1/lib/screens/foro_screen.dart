import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/new_post_screen.dart';

class ForoScreen extends StatefulWidget {
  @override
  _ForoScreenState createState() => _ForoScreenState();
}

class _ForoScreenState extends State<ForoScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Text('Contenido del Foro', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
    NewPostScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foro Ciudadano'),
        backgroundColor: Colors.black,  // Fondo negro para el AppBar
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Fondo negro para la barra inferior
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.forum, color: Colors.white),
            label: 'Foro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: Colors.white),
            label: 'Publicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
