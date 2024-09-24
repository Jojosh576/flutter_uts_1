// history_page.dart
import 'package:flutter/material.dart';
import 'transaction.dart'; 
import 'transaction_service.dart'; 

class HistoryPage extends StatelessWidget {
  final List<Transaction> transactionHistory = getTransactionHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History Transaksi',
          style: TextStyle(
            color: Colors.white,          
            fontWeight: FontWeight.bold,  
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 121, 12, 12), 
      ),
      body: Container(
        color: const Color.fromARGB(255, 246, 234, 234),
        child: ListView.builder(
          itemCount: transactionHistory.length,
          itemBuilder: (context, index) {
            final transaction = transactionHistory[index];
            return Column(
              children: [
                ListTile(
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
                      color: transaction.amount < 0 ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
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
