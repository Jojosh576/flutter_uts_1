import 'package:flutter/material.dart';
import 'confirmation_screen.dart'; // Pastikan untuk mengimpor file confirmation_screen.dart

class TopupScreen extends StatefulWidget {
  @override
  _TopupScreenState createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  String _selectedMethod = 'Bank Transfer';
  String _nominal = '';
  String _paymentInfo = '';
  final String _dummyVirtualAccount = '1234567890';
  final List<String> _paymentMethods = [
    'Bank Transfer',
    'Credit Card',
    'Pulsa'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 0, 0),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Topup',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Metode Pembayaran',
                border: OutlineInputBorder(),
              ),
              value: _selectedMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMethod = newValue!;
                  _nominal = '';
                  _paymentInfo = '';
                });
              },
              items: _paymentMethods
                  .map<DropdownMenuItem<String>>((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (_selectedMethod == 'Bank Transfer') ...[
              Text(
                'Nomor Virtual Account Anda:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                _dummyVirtualAccount,
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ] else if (_selectedMethod == 'Credit Card') ...[
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nomor Kartu Kredit',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _paymentInfo = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nominal Pembayaran',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _nominal = value;
                  });
                },
              ),
            ] else if (_selectedMethod == 'Pulsa') ...[
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nomor Handphone',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _paymentInfo = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nominal Pembayaran',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _nominal = value;
                  });
                },
              ),
            ],
            SizedBox(height: 20),
            if (_selectedMethod != 'Bank Transfer')
              ElevatedButton(
                onPressed: () {
                  if (_nominal.isNotEmpty && _paymentInfo.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationScreen(
                          method: _selectedMethod,
                          nominal: _nominal,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Harap isi semua informasi yang diperlukan'),
                      ),
                    );
                  }
                },
                child: Text('Proceed to Confirmation'),
              ),
          ],
        ),
      ),
    );
  }
}
