import 'dart:async';

import 'package:everyday_invest/main.dart';
import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/model/onboarding_model.dart';
import 'package:everyday_invest/src/features/authentication/view/onboarding/onboarding_page_view.dart';
import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:everyday_invest/src/features/home/view/navigation_page.dart';
import 'package:everyday_invest/src/testing/test_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

enum HomeListType {
  indianStock("IND Stocks"),
  usStocks("US Stocks"),
  etfs("ETFs"),
  indices("Indices");

  const HomeListType(this.text);
  final String text;
}

enum StockTime { Indian, US }

class HomePageViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> homeBottomWidgetTabs = [];

  final List<List<StockInfo>> homePageStockInfo =
      TestData().homePageStockInfoTest;
  final List<StockInfo> homeTopGainers = TestData().homeTopGainersTest;
  final List<StockInfo> homeTopLosers = TestData().homeTopLosersTest;

  List<YahooFinanceCandleData> indexPriceList = [];
  late StreamController<YahooFinanceCandleData> _indexPriceListStreamController;
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

    _indexPriceListStreamController =
        StreamController<YahooFinanceCandleData>();
    _startIndexPriceStream();
  }

  getMajorIndexTickerDataOfTicker() async {
    indexPriceList.clear();
    DateTime? dateToFetch = isValidTimeRange(StockTime.Indian)
        ? DateTime.now()
        : DateTime.now().subtract(Duration(days: 1));

    final NSEPrice = await YahooFinanceService().getTickerData(
      '^NSEI',
      startDate: dateToFetch,
      adjust: true,
    );

    final BSEPrice = await YahooFinanceService().getTickerData(
      '^BSESN',
      startDate: dateToFetch,
      adjust: true,
    );
    indexPriceList.add(NSEPrice.first);
    indexPriceList.add(BSEPrice.first);

    print(
        "Ticker : NSE = ${indexPriceList[0].adjClose}, BSE = ${indexPriceList[1].adjClose}");
  }

  Future<List<YahooFinanceCandleData>> getDataOfTicker(String ticker) async {
    DateTime? dateToFetch = isValidTimeRange(StockTime.Indian)
        ? DateTime.now()
        : DateTime.now().subtract(Duration(days: 1));
    final tickerPrice = await YahooFinanceService().getTickerData(
      ticker,
      startDate: dateToFetch,
      adjust: true,
    );

    print("Ticker : $ticker = ${indexPriceList[0].adjClose}");

    return tickerPrice;
  }

  bool isValidTimeRange(StockTime timeType) {
    TimeOfDay startTime = timeType == StockTime.Indian
        ? TimeOfDay(hour: 9, minute: 30)
        : TimeOfDay(hour: 19, minute: 0);
    TimeOfDay endTime = timeType == StockTime.Indian
        ? TimeOfDay(hour: 16, minute: 0)
        : TimeOfDay(hour: 24, minute: 0);
    TimeOfDay now = TimeOfDay.now();
    return ((now.hour > startTime.hour) ||
            (now.hour == startTime.hour && now.minute >= startTime.minute)) &&
        ((now.hour < endTime.hour) ||
            (now.hour == endTime.hour && now.minute <= endTime.minute));
  }

  void _startIndexPriceStream() async {
    Timer.periodic(
        Duration(seconds: 10), (Timer t) => getMajorIndexTickerDataOfTicker());
  }
}
