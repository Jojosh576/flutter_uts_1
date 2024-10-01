import 'package:flutter/material.dart';

class TagihanPage extends StatefulWidget {
  const TagihanPage({super.key});

  @override
  State<TagihanPage> createState() => _TagihanPageState();
}

class _TagihanPageState extends State<TagihanPage> {
  Widget iconCategory(IconData icon, String label) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 30,
            child: Icon(
              icon,
              size: 30,
              color: const Color.fromARGB(255, 117, 0, 0),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 0, 0),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Pulsa, Tagihan & Ticket',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Isi Ulang',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconCategory(Icons.phone_android, 'Pulsa'),
                      iconCategory(Icons.wifi, 'Paket Data'),
                      iconCategory(Icons.public, 'Roaming'),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Tagihan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      iconCategory(Icons.lightbulb, 'Listrik PLN'),
                      iconCategory(Icons.health_and_safety, 'BPJS'),
                      iconCategory(Icons.phone, 'Telkom'),
                      iconCategory(Icons.water_drop, 'PDAM'),
                      iconCategory(Icons.payment, 'Angsuran Kredit'),
                      iconCategory(Icons.credit_card, 'Kartu Kredit'),
                      iconCategory(Icons.home, 'PBB'),
                      iconCategory(Icons.tv, 'TV Kabel & Internet'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
