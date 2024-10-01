import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transaction_service.dart';

class HistoryPage extends StatelessWidget {
  final List<Transaction> transactionHistory = getTransactionHistory();

  String getIconForTransaction(String title) {
    switch (title) {
      case 'Pembelian Pulsa':
        return 'lib/icons/payment.png';
      case 'Pembayaran SKS':
        return 'lib/icons/payment.png';
      case 'Pembayaran BPP':
        return 'lib/icons/payment.png';
      case 'Transfer ke Rekening':
        return 'lib/icons/send.png';
      case 'Top Up e-Wallet':
        return 'lib/icons/topup2.png';
      case 'Transfer ke Bank ABC':
        return 'lib/icons/send.png';
      default:
        return 'lib/icons/payment.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Riwayat Transaksi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 117, 0, 0),
      ),
      body: Container(
        color: const Color.fromARGB(255, 246, 234, 234),
        child: ListView.builder(
          itemCount: transactionHistory.length,
          itemBuilder: (context, index) {
            final transaction = transactionHistory[index];
            
            final iconPath = getIconForTransaction(transaction.title);
            
            return Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    iconPath, 
                    width: 40, 
                    height: 40, 
                  ),
                  title: Text(
                    transaction.title,
                    style: TextStyle(color: const Color.fromARGB(255, 9, 9, 9)),
                  ),
                  subtitle: Text(
                    transaction.date,
                    style: TextStyle(color: const Color.fromARGB(255, 3, 3, 3)),
                  ),
                  trailing: Text(
                    'Rp ${transaction.amount.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: (transaction.title.contains('Pembelian') || 
                              transaction.title.contains('Pembayaran') || 
                              transaction.title.contains('Transfer')) 
                              ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
