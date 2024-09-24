// transaction_service.dart
import 'transaction.dart'; // Import model Transaction

List<Transaction> getTransactionHistory() {
  // Contoh data dummy
  return [
    Transaction(title: 'Pembelian Pulsa', date: '2024-10-01', amount: 100000),
    Transaction(title: 'Pembayaran SKS', date: '2024-09-25', amount: 8800000),
    Transaction(title: 'Pembayaran BPP', date: '2024-09-05', amount: 8000000),
    Transaction(title: 'Transfer ke Rekening', date: '2024-08-20', amount: 1200000),
    Transaction(title: 'Top Up e-Wallet', date: '2024-08-18', amount: 100000),
  ];
}
