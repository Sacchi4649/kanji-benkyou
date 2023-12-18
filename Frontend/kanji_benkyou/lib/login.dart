import 'package:flutter/material.dart';
import 'register.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

  class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(

      backgroundColor: const Color.fromRGBO(69, 46, 201, 1),
      toolbarHeight: 50.0,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.asset(
              'assets/logo.png', 
              width: 200,
              height: 200, 
              ),
             

              const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Masukkan Akun',
                      style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 144, 144, 144)),
                    ),
                  ],
                ),

              const SizedBox(height: 10),
              
              Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10),
               
               child :TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  fillColor: Color.fromRGBO(231, 231, 231, 1),
                  hintText: 'Nama Pengguna',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  labelText: 'Nama Pengguna',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black87),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              ),

              const SizedBox(height: 10),

              Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10),

              child :TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  fillColor: Color.fromRGBO(231, 231, 231, 1),
                  hintText: 'kata Sandi',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  labelText: 'Kata Sandi',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black87),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              ),
              
              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: () {
                  // Implement login logic here
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  // You can add your authentication logic here

                  print('Username: $username');
                  print('Password: $password');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(69, 46, 201, 1),
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 128),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
             
             const SizedBox(height: 5),
             
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
                  elevation: 5, 
                  padding: const EdgeInsets.symmetric(horizontal: 133),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), 
                     side: BorderSide(color: Color.fromRGBO(69, 46, 201, 1)),
                  ),
                ),
                child: const Text(
                  'Tamu',
                  style: TextStyle(fontSize: 18, color: Color.fromRGBO(69, 46, 201, 1)),
                ),
              ),

            GestureDetector(
                  onTap: () {
                    // Navigate to Register.dart when "Daftar sini" is tapped
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()), // Replace RegisterScreen with the actual class name
                    );
                  },
                  child: const Text(
                    'Tidak punya akun? Daftar sini',
                    style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 144, 144, 144), fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    )
  );
  }
}
