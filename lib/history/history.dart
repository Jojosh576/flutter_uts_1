import 'package:flutter/material.dart';
import 'history_page.dart';

void main() {
  runApp(DigitalWalletApp());
}

class DigitalWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HistoryPage(),
    );
  }
}
