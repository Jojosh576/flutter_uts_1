import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: Colors.lightBlue[50], // Background color for all screens
      ),
      debugShowCheckedModeBanner: false, // Hapus banner debug
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State untuk menyimpan nilai input pengguna
  String _selectedMethod = 'Bank Transfer'; // Default method
  String _nominal = '';
  String _paymentInfo = ''; // Untuk menyimpan informasi kartu kredit atau nomor HP

  // Dummy nomor virtual account
  final String _dummyVirtualAccount = '1234567890';

  // Daftar metode pembayaran
  final List<String> _paymentMethods = ['Bank Transfer', 'Credit Card', 'Pulsa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      backgroundColor: Colors.lightBlue[50], // Background color for this screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Dropdown untuk memilih metode pembayaran
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Metode Pembayaran',
                border: OutlineInputBorder(),
              ),
              value: _selectedMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMethod = newValue!;
                  _nominal = ''; // Reset nominal saat metode berubah
                  _paymentInfo = ''; // Reset info pembayaran
                });
              },
              items: _paymentMethods.map<DropdownMenuItem<String>>((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Kondisional untuk input berdasarkan metode pembayaran yang dipilih
            if (_selectedMethod == 'Bank Transfer') ...[
              // Tampilkan nomor virtual account dummy tanpa tombol
              Text(
                'Nomor Virtual Account Anda:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                _dummyVirtualAccount, // Nomor virtual account dummy
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
              // Input untuk nominal pembayaran
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
              // Input untuk nominal pembayaran
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

            // Tombol hanya untuk metode selain Bank Transfer
            if (_selectedMethod != 'Bank Transfer')
              ElevatedButton(
                onPressed: () {
                  // Validasi input untuk Credit Card dan Pulsa
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
                      SnackBar(content: Text('Harap masukkan semua informasi yang diperlukan')),
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

class ConfirmationScreen extends StatelessWidget {
  final String method;
  final String nominal;

  ConfirmationScreen({required this.method, required this.nominal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Pembayaran'),
      ),
      backgroundColor: Colors.lightBlue[50], // Background color for this screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metode Pembayaran: $method',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Nominal: Rp $nominal',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Top Up berhasil!')),
                  );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Konfirmasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
