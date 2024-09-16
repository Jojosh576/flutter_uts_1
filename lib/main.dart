import 'package:flutter/material.dart';
import 'confirmation_screen.dart';  // Pastikan nama file dan kelas sesuai

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConfirmationScreen(
        method: 'Bank Transfer',  // Contoh parameter
        nominal: '100000',        // Contoh parameter
      ),
    );
  }
}
