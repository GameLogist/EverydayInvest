enum HomeListType {
  indianStock("IND Stocks"),
  usStocks("US Stocks"),
  etfs("ETFs"),
  indices("Indices");

  const HomeListType(this.text);
  final String text;
}

enum StockTime { Indian, US }

enum Indices {
  NSE(0),
  BSE(1);

  const Indices(this.idx);
  final int idx;
}
