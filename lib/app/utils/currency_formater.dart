import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String idr(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0, // Sesuaikan jumlah desimal sesuai kebutuhan
    );
    return formatter.format(amount);
  }
  static String idrWithSymbol(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0, // Sesuaikan jumlah desimal sesuai kebutuhan
    );
    return formatter.format(amount);
  }
}