import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  final String method;
  final String nominal;

  ConfirmationScreen({required this.method, required this.nominal});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _isSuccessVisible = false; // State untuk mengatur visibilitas animasi

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
              'Metode Pembayaran: ${widget.method}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nominal: Rp ${widget.nominal}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 32),
            
            // Tombol Konfirmasi
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSuccessVisible = true; // Tampilkan animasi saat diklik
                  });

                  Future.delayed(Duration(seconds: 2), () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Top Up berhasil!'),
                      ),
                    );
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
                child: Text('Konfirmasi'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
              ),
            ),
            
            SizedBox(height: 32),

            // Animasi Top-Up Berhasil menggunakan AnimatedOpacity
            Center(
              child: AnimatedOpacity(
                opacity: _isSuccessVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Top Up Berhasil!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
