enum StockType {
  indianStock("Equity Stock"),
  usStock("US Stock"),
  etf("ETF"),
  indice("Indice");

  const StockType(this.text);
  final String text;
}

class StockInfo {
  final String name;
  final String ticker;
  final double price;
  final StockType type;
  double absoluteChange;
  String percentChange;

  StockInfo(
      {required this.name,
      required this.ticker,
      required this.price,
      required this.type,
      this.absoluteChange = 0.0,
      this.percentChange = ''});
}
