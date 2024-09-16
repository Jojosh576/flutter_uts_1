import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Import loginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LingTan E-wallet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 2, 2), // Warna utama dari seedColor
          brightness: Brightness.light, // Jika ingin light theme
        ),
        useMaterial3: true, // Optional, menggunakan Material 3 design jika diinginkan
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 0, 0), // Background warna biru
      body: Center(
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height, // Adjust the container height to screen size
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/redbackground.jpg'), // Background image
                fit: BoxFit.cover, // Adjust how the image fits the background
              ),
            ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Image.asset(
              'assets/image/lingpay.png',
              width: 250,
              height: 200,
            ),
            // const SizedBox(height: 20),
            // // Icon Wallet
            // const Icon(
            //   Icons.account_balance_wallet_outlined,
            //   size: 100,
            //   color: Colors.white,
            // ),
            const SizedBox(height: 10),
            const Text(
              'Dompet digital untuk Anda!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30), // Atur margin kiri dan kanan
              child: Text(
              'Simpan uang tunai dan kartu debit/kredit Anda dengan mudah di LingPay!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white),
            ),
          ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Tombol untuk lanjut ke Login Screen
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => loginScreen(), // Menggunakan loginScreen dengan nama kelas yang benar
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(vertical: 21,horizontal: 155)
                    ),
                    child: const Text(
                      'Mulai',
                      style: TextStyle(
                        color: Color.fromARGB(255, 121, 16, 16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ],
          ),  
        ),
      ),
    );
  }
}
