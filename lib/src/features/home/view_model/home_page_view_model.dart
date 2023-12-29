import 'package:everyday_invest/main.dart';
import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/model/onboarding_model.dart';
import 'package:everyday_invest/src/features/authentication/view/onboarding/onboarding_page_view.dart';
import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:everyday_invest/src/features/home/view/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

enum HomeListType {
  indianStock("IND Stocks"),
  usStocks("US Stocks"),
  etfs("ETFs"),
  indices("Indices");

  const HomeListType(this.text);
  final String text;
}

class HomePageViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> homeBottomWidgetTabs = [];
  final List<List<StockInfo>> homePageStockInfo = [
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

  late TabController tabController;
  int page = 0;

  @override
  void onInit() {
    super.onInit();

    // Add all Enum types to home screen tabs
    for (var value in HomeListType.values) {
      homeBottomWidgetTabs.add(Tab(text: value.text));
    }

    // Initialize tab controller
    tabController = TabController(
      length: homeBottomWidgetTabs.length,
      vsync: this,
    );
  }
}
