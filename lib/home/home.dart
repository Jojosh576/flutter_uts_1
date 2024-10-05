import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uts_1/Topup/Topup_screen.dart';
import 'package:flutter_uts_1/history/history_page.dart';
import 'package:flutter_uts_1/home/settings_page.dart';
import 'package:flutter_uts_1/home/tagihan_page.dart';
import 'package:flutter_uts_1/util/my_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import '/send/send_money_screen.dart';
import 'package:flutter_uts_1/send/send_money_screen.dart';
import 'package:flutter_uts_1/request/request_money_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageController controller = PageController();

  final List<Widget> _screens = [
    HomeScreenContent(),
    QRScannerScreen(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            _currentIndex = index;
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

  void updateSaldo(int nominal, {bool isTopUp = false}) {
    setState(() {
      if (isTopUp) {
        saldo[0] += nominal;
      } else {
        saldo[0] -= nominal;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 0, 0),
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage('assets/image/lingpayw.png'), height: 40),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // cards
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
                      onTap: () async {
                        final int? topUpAmount = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopupScreen(),
                          ),
                        );

                        if (topUpAmount != null && topUpAmount > 0) {
                          updateSaldo(topUpAmount, isTopUp: true);
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
                // Request
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        try {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RequestMoneyScreen(saldo: saldo[0]),
                            ),
                          );
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
            // Tagihan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TagihanPage()),
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
                                height: 50,
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
                                        fontSize: 18,
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
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(11),
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
                                height: 50,
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
                                        fontSize: 18,
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
                  const SizedBox(
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

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String result = '';
  bool isScanning = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startBarcodeScanner();
    });
  }

  void _startBarcodeScanner() async {
    var res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SimpleBarcodeScannerPage(),
      ),
    );

    if (res is String && res.isNotEmpty && res != '-1') {
      setState(() {
        result = res;
        isScanning = false;
      });
      await _launchURL(result);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else {
      setState(() {
        isScanning = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Scan dibatalkan')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
      ),
      body: Center(
        child: isScanning
            ? const CircularProgressIndicator()
            : const Text("QR Scanner dibatalkan"),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'https://$url';
    }

    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tidak dapat meluncurkan $url')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }
}
