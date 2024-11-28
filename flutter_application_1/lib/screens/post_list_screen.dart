import 'package:flutter/material.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publicaciones'),
      ),
      body: ListView.builder(
        itemCount: 10, // Número de publicaciones de ejemplo
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.image),
              title: Text('Publicación ${index + 1}'),
              subtitle: Text('Descripción breve de la publicación'),
              onTap: () {
                // Navegación a los detalles de la publicación
              },
            ),
          );
        },
      ),
    );
  }
}
