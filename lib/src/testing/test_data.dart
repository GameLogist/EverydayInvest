import 'package:everyday_invest/src/features/home/model/home_page_models.dart';

class TestData {
  final List<List<StockInfo>> homePageStockInfoTest = [
    [
      StockInfo(
          name: "HDFC Bank",
          ticker: "HDFCBANK",
          price: 1709.25,
          type: StockType.indianStock),
      StockInfo(
          name: "Coal India",
          ticker: "COALINDIA",
          price: 376.00,
          type: StockType.indianStock),
      StockInfo(
          name: "Hindustan Uniliver",
          ticker: "HINDUNILVR",
          price: 2663.25,
          type: StockType.indianStock),
      StockInfo(
          name: "Infosys",
          ticker: "INFY",
          price: 1542.85,
          type: StockType.indianStock),
      StockInfo(
          name: "Embassy Office Parks REIT",
          ticker: "EMBASSY",
          price: 325.09,
          type: StockType.indianStock),
      StockInfo(
          name: "HDFC Bank",
          ticker: "HDFCBANK",
          price: 1709.25,
          type: StockType.indianStock),
      StockInfo(
          name: "Coal India",
          ticker: "COALINDIA",
          price: 376.00,
          type: StockType.indianStock),
      StockInfo(
          name: "Hindustan Uniliver",
          ticker: "HINDUNILVR",
          price: 2663.25,
          type: StockType.indianStock),
      StockInfo(
          name: "Infosys",
          ticker: "INFY",
          price: 1542.85,
          type: StockType.indianStock)
    ],
    [
      StockInfo(
          name: "Intuit Inc.",
          ticker: "INTU",
          price: 630.83,
          type: StockType.usStock),
      StockInfo(
          name: "Alphabet Inc. Class A Shares",
          ticker: "GOOGL",
          price: 140.09,
          type: StockType.usStock),
      StockInfo(
          name: "Visa, Inc.",
          ticker: "V",
          price: 260.89,
          type: StockType.usStock),
      StockInfo(
          name: "Apple, Inc.",
          ticker: "AAPL",
          price: 193.33,
          type: StockType.usStock),
      StockInfo(
          name: "A&p Global, Inc.",
          ticker: "SPGI",
          price: 443.36,
          type: StockType.usStock)
    ],
    [
      StockInfo(
          name: "Nifty BEES",
          ticker: "NIFTYBEES",
          price: 1200,
          type: StockType.etf),
      StockInfo(
          name: "IT BEES", ticker: "ITBEES", price: 37.36, type: StockType.etf),
      StockInfo(
          name: "Liquid BEES",
          ticker: "LIQUIDBEES",
          price: 1000.01,
          type: StockType.etf),
      StockInfo(
          name: "MAFANG", ticker: "MAFANG", price: 73.01, type: StockType.etf),
      StockInfo(
          name: "Gold Bees",
          ticker: "GOLDBEES",
          price: 52.66,
          type: StockType.etf)
    ],
    [
      StockInfo(
          name: "Nifty BEES",
          ticker: "NIFTYBEES",
          price: 1200,
          type: StockType.etf),
      StockInfo(
          name: "IT BEES", ticker: "ITBEES", price: 37.36, type: StockType.etf),
      StockInfo(
          name: "Liquid BEES",
          ticker: "LIQUIDBEES",
          price: 1000.01,
          type: StockType.etf),
      StockInfo(
          name: "MAFANG", ticker: "MAFANG", price: 73.01, type: StockType.etf),
      StockInfo(
          name: "Gold Bees",
          ticker: "GOLDBEES",
          price: 52.66,
          type: StockType.etf)
    ]
  ];

  final List<StockInfo> homeTopGainersTest = [
    StockInfo(
        name: "Intuit Inc.",
        ticker: "INTU",
        price: 630.83,
        type: StockType.usStock),
    StockInfo(
        name: "Alphabet Inc. Class A Shares",
        ticker: "GOOGL",
        price: 140.09,
        type: StockType.usStock),
    StockInfo(
        name: "Visa, Inc.",
        ticker: "V",
        price: 260.89,
        type: StockType.usStock),
    StockInfo(
        name: "Apple, Inc.",
        ticker: "AAPL",
        price: 193.33,
        type: StockType.usStock),
    StockInfo(
        name: "A&p Global, Inc.",
        ticker: "SPGI",
        price: 443.36,
        type: StockType.usStock)
  ];

  final List<StockInfo> homeTopLosersTest = [
    StockInfo(
        name: "Intuit Inc.",
        ticker: "INTU",
        price: 630.83,
        type: StockType.usStock),
    StockInfo(
        name: "Alphabet Inc. Class A Shares",
        ticker: "GOOGL",
        price: 140.09,
        type: StockType.usStock),
    StockInfo(
        name: "Visa, Inc.",
        ticker: "V",
        price: 260.89,
        type: StockType.usStock),
    StockInfo(
        name: "Apple, Inc.",
        ticker: "AAPL",
        price: 193.33,
        type: StockType.usStock),
    StockInfo(
        name: "A&p Global, Inc.",
        ticker: "SPGI",
        price: 443.36,
        type: StockType.usStock)
  ];
}
