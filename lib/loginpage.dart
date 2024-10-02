import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  // Function redirect
  _navigateToHome() async {
    await Future.delayed(
        Duration(seconds: 3)); // Durasi untuk masuk ke halaman home
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 21, 223, 125),
                const Color.fromARGB(255, 240, 243, 80)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
                20.0), // Menambahkan padding di seluruh body
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Mengatur posisi kolom di tengah
              children: [
                _logoAndUsernameField(),
                SizedBox(height: 20), // Memberi jarak antara field
                _passwordField(),
                SizedBox(height: 20), // Memberi jarak antara field
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoAndUsernameField() {
    return Column(
      children: [
        Positioned(
          top: 30,
          left: 30,
          child: Text(
            'BELA NEGARA ',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 50,
          left: 30,
          child: _usernameField(),
        ),
      ],
    );
  }

  Widget _usernameField() {
    return TextFormField(
      onChanged: (value) {
        username = value;
      },
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.all(8),
        filled: true, // Mengaktifkan pengisian warna
        fillColor: Colors.white, // Warna latar belakang field menjadi putih
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      onChanged: (value) {
        password = value;
      },
      obscureText: visible,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
        ),
        hintText: 'Password',
        contentPadding: EdgeInsets.all(8),
        filled: true, // Mengaktifkan pengisian warna
        fillColor: Colors.white, // Warna latar belakang field menjadi putih
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String text = '';
        if (username == 'Saya' && password == 'abc123') {
          _navigateToHome();
          setState(() {
            text = "Login berhasil";
            isLoginSuccess = true;
          });
        } else {
          text = "Login gagal";
          isLoginSuccess = false;
        }
        SnackBar snackBar = SnackBar(
          content: Text(text),
          backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Updated property
        foregroundColor: Colors.white, // Updated property
      ),
      child: Text('Login'),
    );
  }
}
