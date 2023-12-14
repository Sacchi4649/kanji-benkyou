import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanji Benkyou'), 
        centerTitle: true,
        ),
      
      body: const Center(
        child: Text ('Halaman home'),
        
        ),
    );
  }
}