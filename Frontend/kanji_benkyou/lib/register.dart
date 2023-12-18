import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Register Form',
      home: RegisterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

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
                      'Buat Akun',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 144, 144, 144)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      fillColor: Color.fromRGBO(231, 231, 231, 1),
                      hintText: 'Nama Pengguna',
                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      labelText: 'Nama Pengguna',
                      labelStyle:
                          TextStyle(fontSize: 12, color: Colors.black87),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      fillColor: Color.fromRGBO(231, 231, 231, 1),
                      hintText: 'Kata Sandi',
                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      labelText: 'Kata Sandi',
                      labelStyle:
                          TextStyle(fontSize: 12, color: Colors.black87),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _confirmPassController,
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      fillColor: Color.fromRGBO(231, 231, 231, 1),
                      hintText: 'Konfirmasi Kata Sandi',
                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      labelText: 'Konfirmasi Kata Sandi',
                      labelStyle:
                          TextStyle(fontSize: 12, color: Colors.black87),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                ElevatedButton(
                  onPressed: () {
                    // Implement registrasi logic here
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    String confirmPass = _confirmPassController.text;

                    // You can add your registration logic here

                    print('Username: $username');
                    print('Password: $password');
                    print('Confirm Password: $confirmPass');
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
                    'Daftar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    // Implement back logic here or navigate back
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(horizontal: 121),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                          color: Color.fromRGBO(69, 46, 201, 1)),
                    ),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(69, 46, 201, 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
