import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String method;
  final String nominal;

  ConfirmationScreen({required this.method, required this.nominal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Top Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metode Pembayaran: $method',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nominal: Rp $nominal',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Top Up berhasil!'),
                    ),
                  );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Konfirmasi'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
