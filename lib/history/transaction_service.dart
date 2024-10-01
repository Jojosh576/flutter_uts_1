import 'transaction.dart';

List<Transaction> getTransactionHistory() {

  return [
    Transaction(title: 'Pembelian Pulsa', date: '2024-10-01', amount: 100000),
    Transaction(title: 'Pembayaran SKS', date: '2024-09-25', amount: 8800000),
    Transaction(title: 'Pembayaran BPP', date: '2024-09-05', amount: 8000000),
    Transaction(title: 'Transfer ke Rekening', date: '2024-08-20', amount: 1200000),
    Transaction(title: 'Top Up e-Wallet', date: '2024-08-18', amount: 100000),
    Transaction(title: 'Pembayaran BPJS', date: '2024-08-10', amount: 100000),
    Transaction(title: 'Top Up e-Wallet', date: '2024-08-5', amount: 5000000),
    Transaction(title: 'Pembayaran Listrik', date: '2024-08-1', amount: 2000000),
    Transaction(title: 'Pembelian Paket Data', date: '2024-07-25', amount: 80000),
    Transaction(title: 'Transfer ke Bank ABC', date: '2024-07-18', amount: 3000000),
  ];
}
