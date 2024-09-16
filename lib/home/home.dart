import 'package:flutter/material.dart';
import 'package:flutter_uts_1/util/my_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Scaffold(
      body: SafeArea(
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
              height: 25,
            ),

            //cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: const [
                  MyCard(
                    uang: 150000000.00,
                    nokartu: 33312312,
                    expbulan: 12,
                    exptahun: 20,
                    warna: Colors.blue,
                  ),
                  MyCard(
                    uang: 22990093.00,
                    nokartu: 33312312,
                    expbulan: 12,
                    exptahun: 20,
                    warna: Colors.blue,
                  ),
                  MyCard(
                    uang: 250123124.00,
                    nokartu: 33312312,
                    expbulan: 12,
                    exptahun: 20,
                    warna: Colors.blue,
                  ),
                  MyCard(
                    uang: 250000000000.00,
                    nokartu: 33312312,
                    expbulan: 12,
                    exptahun: 20,
                    warna: Colors.blue,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade700),
            )
          ],
        ),
      ),
    );
  }
}
