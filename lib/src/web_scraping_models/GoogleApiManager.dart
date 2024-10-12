enum MarketSegment {
  mostActive("Most Active"),
  topGainers("Top Gainers"),
  topLosers("Top Losers"),
  usStock("US Stock"),
  etf("ETF"),
  indice("Indice"),
  crypto("Crypto");

  const MarketSegment(this.text);
  final String text;
}

class GoogleApiMarketSegment {
  final MarketSegment type;
  final String googleUrl;

  GoogleApiMarketSegment({required this.type, required this.googleUrl});
}

// Singleton
class GoogleAPIManager {

  // Private constructor
  GoogleAPIManager._sharedInstance();

  // Static final instance
  static final GoogleAPIManager _instance = GoogleAPIManager._sharedInstance();
  
  // Static method
  static GoogleAPIManager get shared {
    return _instance;
  }

  // Variables
  var mostActive = GoogleApiMarketSegment(
      type: MarketSegment.mostActive,
      googleUrl: 'https://www.google.com/finance/markets/most-active');

  var topGainers = GoogleApiMarketSegment(
      type: MarketSegment.topGainers,
      googleUrl: 'https://www.google.com/finance/markets/gainers');

  var topLosers = GoogleApiMarketSegment(
      type: MarketSegment.topLosers,
      googleUrl: 'https://www.google.com/finance/markets/losers');
  
  var usStocks = GoogleApiMarketSegment(
      type: MarketSegment.usStock,
      googleUrl: 'https://www.google.com/finance/markets/most-active');
  
  var etfs = GoogleApiMarketSegment(
      type: MarketSegment.etf,
      googleUrl: 'https://www.google.com/finance/markets/most-active');

  var cryptos = GoogleApiMarketSegment(
      type: MarketSegment.indice,
      googleUrl: 'https://www.google.com/finance/markets/cryptocurrencies');
}
