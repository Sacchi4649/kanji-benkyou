import 'package:flutter/material.dart';
import 'Splashscreen.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false, // Menghilangkan banner debug
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello",
      home: Splashscreen(
        
         
      ),
    );
  }

  
}
