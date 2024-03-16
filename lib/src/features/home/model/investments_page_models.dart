import 'dart:ui';

class PieChartSector {
  final Color color;
  final String? name;
  final String? ticker;
  final double value;
  final double? price;

  PieChartSector(
      {this.name,
      this.ticker,
      this.price,
      required this.color,
      required this.value});
}
