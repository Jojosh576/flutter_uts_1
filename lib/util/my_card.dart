import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final double uang;
  final int nokartu;
  final int expbulan;
  final int exptahun;
  final warna;

  const MyCard({
    super.key,
    required this.uang,
    required this.nokartu,
    required this.expbulan,
    required this.exptahun,
    this.warna,
  });

  @override
  Widget build(BuildContext context) {
    //format uang
    final formatter = NumberFormat('#,##0');
    String formattedUang = formatter.format(uang);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        decoration: BoxDecoration(
            color: warna, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saldo',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rp.' + formattedUang.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nokartu.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  expbulan.toString() + '/' + exptahun.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
