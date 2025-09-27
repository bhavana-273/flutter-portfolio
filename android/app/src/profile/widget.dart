import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row & Column Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row & Column Widget Example'),
        ),
        body: Column(

          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.red, size: 40),
            SizedBox(width: 10, height: 10), // Space between widgets
            Icon(Icons.star, color: Colors.green, size: 40),
            SizedBox(width: 10, height: 10),
            Icon(Icons.star, color: Colors.blue, size: 40),
          ],

        ),
      ),
    );
  }
}