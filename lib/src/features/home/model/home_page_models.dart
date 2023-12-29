import 'dart:ui';

enum StockType { indice, indianStock, usStock, etf }

class StockInfo {
  final String name;
  final String ticker;
  final double price;
  final StockType type;

  StockInfo(
      {required this.name,
      required this.ticker,
      required this.price,
      required this.type});
}
