import "package:flutter/material.dart";
import "package:learning_flutter/widgets/content_column.dart";

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            ContentColumn(title: 'Primera columna', description: 'Primer párrafo',),
            ContentColumn(title: 'Segunda columna', description: 'Segundo párrafo',),
            ContentColumn(title: 'Tercer columna', description: 'Tercer párrafo',)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

