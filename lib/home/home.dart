import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uts_1/Topup/Topup_screen.dart';
import 'package:flutter_uts_1/history/history_page.dart';
import 'package:flutter_uts_1/util/my_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/send/send_money_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageController controller = PageController();

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const QRScannerScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 117, 0, 0),
        animationDuration: const Duration(milliseconds: 300),
        index: _currentIndex,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengubah indeks saat item diklik
          });
        },
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final List<double> saldo = [150000000.00, 22990093.00];
  void updateSaldo(int nominal) {
    setState(() {
      saldo[0] -= nominal;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Ling',
                        style: TextStyle(
                            fontSize: 29, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pay',
                        style: TextStyle(fontSize: 29),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //cards
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: [
                  MyCard(
                    uang: saldo[0],
                    nokartu: 33312312,
                    expbulan: 12,
                    exptahun: 20,
                    warna: Color.fromARGB(255, 117, 0, 0),
                  ),
                  MyCard(
                    uang: saldo[1],
                    nokartu: 33312312,
                    expbulan: 12,
                    exptahun: 20,
                    warna: Color.fromARGB(255, 117, 0, 0),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 20,
            ),
            // button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Transfer
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        try {
                          final int? nominal = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SendMoneyScreen(saldo: saldo[0]),
                            ),
                          );

                          if (nominal != null && nominal > 0) {
                            updateSaldo(nominal);
                          }
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 117, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700,
                                blurRadius: 10,
                              )
                            ]),
                        child: Center(
                          child: Image.asset('lib/icons/fund.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kirim',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                // Topup
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TopupScreen()),
                        );
                      },
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 117, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700,
                                blurRadius: 10,
                              )
                            ]),
                        child: Center(
                          child: Image.asset('lib/icons/topup.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Isi Ulang',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                //Tagihan
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 117, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700,
                                blurRadius: 10,
                              )
                            ]),
                        child: Center(
                          child: Image.asset('lib/icons/request.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Minta',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //Tagihan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 117, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade700,
                              blurRadius: 10,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 60,
                                child: Image.asset('lib/icons/bill.png'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tagihan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Lihat Pembayaran',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // History
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HistoryPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 117, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade700,
                              blurRadius: 10,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 60,
                                child: Image.asset('lib/icons/history.png'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Riwayat',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Lihat Riwayat Transaksi',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy class untuk halaman QRScanner
class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("QR Code Scanner Page"),
    );
  }
}

// Dummy class untuk halaman Settings
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Settings Page"),
    );
  }
}
