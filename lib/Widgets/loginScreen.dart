import 'package:flutter/material.dart';
import '../home/home.dart';
import 'registScreen.dart';

class loginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/redbackground.jpg'),
                fit: BoxFit.cover, 
              ),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 54, horizontal: 24),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8),
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
        Image.asset('assets/image/lingpayred.png',
        height: 120,
      ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
        child: Text(
          "Selamat Datang, silahkan masukkan Nama dan Kata Sandi Anda untuk masuk.",
          textAlign: TextAlign.center,
          ),
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
            hintText: "Nama",
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
            hintText: "Kata Sandi",
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

            if (username == '1234' && password == '1234') {
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Home()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Nama atau Kata Sandi salah!"),
                ),
              );
            }
          },
          child: Text(
            "Masuk",
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
    return TextButton(onPressed: () {}, child: Text("Lupa Kata Sandi?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Belum Punya Akun? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const registScreen()),
            );
          },
          child: Text("Daftar"),
        ),
      ],
    );
  }
}
