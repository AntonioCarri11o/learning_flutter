import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    foregroundColor: Colors.white,
                    child: const Text('AH'),
                  ),
                  const SizedBox(width: 8.0,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rodolfo Antonio Carrillo Fuentes', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('Hace 10 minutos', style: TextStyle(fontSize: 12, color: Colors.black54),),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert)
                ],
              ),
            ),
            Image.asset('assets/logo.png', width: double.infinity, height: 300,),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.message),
                  Icon(Icons.ios_share_outlined),
                  Spacer(),
                  Icon(Icons.save_alt),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Datos del usuario"),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Datos del usuario'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Datos del usuario'),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata')),
              ],
            )
          ],
        
        ),
      ),
    );
  }
}