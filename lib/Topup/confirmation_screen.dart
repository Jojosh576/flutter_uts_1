import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmationScreen extends StatelessWidget {
  final String method;
  final String nominal;

  ConfirmationScreen({required this.method, required this.nominal});

  String formatNominal(String nominal) {
    int amount = int.parse(nominal.replaceAll(RegExp(r'[^0-9]'), ''));
    final formatter = NumberFormat("#,###", "id_ID");
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Top-up'),
        backgroundColor: Color.fromARGB(255, 117, 0, 0),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metode Pembayaran: $method',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Nominal: Rp ${formatNominal(nominal)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          SizedBox(width: 8),
                          Text("Top-up Berhasil"),
                        ],
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // Return to the screen before topup_screen with the top-up amount
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.of(context).pop();  // Pop ConfirmationScreen
                    Navigator.of(context).pop(int.parse(nominal.replaceAll(RegExp(r'[^0-9]'), '')));  // Pop topup_screen with amount
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 117, 0, 0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Konfirmasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}