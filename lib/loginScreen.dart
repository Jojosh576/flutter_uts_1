import 'package:flutter/material.dart';
import 'registScreen.dart';

class loginScreen extends StatelessWidget {  // Ganti dari loginScreen ke loginScreen
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height, // Adjust the container height to screen size
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/redbackground.jpg'), // Background image
                fit: BoxFit.cover, // Adjust how the image fits the background
              ),
            ),
            child: Center( // Menambahkan Center agar login box berada di tengah
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 34, horizontal: 24),
                padding: EdgeInsets.all(25), // Padding untuk konten di dalam box
                decoration: BoxDecoration(
                  color: Colors.white, // Background putih
                  borderRadius: BorderRadius.circular(32), // Border radius sebesar 32
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, // Shadow dengan sedikit transparansi
                      blurRadius: 10, // Lebar blur shadow
                      offset: Offset(0, 4), // Posisi shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran container dengan isi
                  children: [
                    SizedBox(height: 50),
                    _header(context),
                    _inputField(context),
                    _forgotPassword(context),
                    _signup(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 1.0),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
        child: Text("Enter your credentials to login"),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.10),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            String username = usernameController.text;
            String password = passwordController.text;

            if (username == 'raja' && password == 'raja') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Login berhasil!"),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Username atau Password salah!"),
                ),
              );
            }
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(onPressed: () {}, child: Text("Forgot password?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const registScreen()),
            );
          },
          child: Text("Sign Up"),
        ),
      ],
    );
  }
}
