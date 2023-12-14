import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Password Form',
      home: ChangePasswordScreen(),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  void _changePassword() {
    // Implement logic to change the password
    String username = _usernameController.text;
    String newPassword = _newPasswordController.text;
    String confirmNewPassword = _confirmNewPasswordController.text;

    // Add your password change logic here
    if (newPassword == confirmNewPassword) {
      // Passwords match, proceed with the change
      print('Password changed successfully for $username');
    } else {
      // Passwords do not match, show an error message
      print('Password and confirmation do not match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Kembali',
         style: TextStyle(
          fontSize: 20, 
          color: Color.fromARGB(255, 112, 112, 112),  
          
          ),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pengaturan Akun',
                      style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),

              const SizedBox(height: 20),


             
            Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10),
               
               child :TextFormField(
                controller:_usernameController,
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

            const SizedBox(height: 20),

             Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10),
               
               child :TextFormField(
                controller: _newPasswordController,
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  fillColor: Color.fromRGBO(231, 231, 231, 1),
                  hintText: 'Password Baru',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  labelText: 'Password Baru',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black87),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              ),

           const SizedBox(height: 20),

            Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10),
               
               child :TextFormField(
                controller: _confirmNewPasswordController,
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  fillColor: Color.fromRGBO(231, 231, 231, 1),
                  hintText: 'Konfirmasi Password Baru',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  labelText: 'Konfirmasi Password Baru',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black87),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              ),


            const SizedBox(height: 20),

            ElevatedButton(
                  onPressed: () {
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
                    'Simpan',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
