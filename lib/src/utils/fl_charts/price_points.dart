import 'dart:collection';

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

// Test Portfolio Data
List<PricePoint> get investmentPortfolioGrowthTest {
  return [
    PricePoint(x: 2018, y: 12344),
    PricePoint(x: 2019, y: 12445),
    PricePoint(x: 2020, y: 12600),
    PricePoint(x: 2021, y: 13001),
    PricePoint(x: 2022, y: 12330),
    PricePoint(x: 2023, y: 14322)
  ];
}
