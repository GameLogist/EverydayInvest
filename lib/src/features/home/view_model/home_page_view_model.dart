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
import 'package:everyday_invest/src/utils/util_funtions/DateTimeUtils.dart';
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
  late TabController tabController;
  int page = 0;

  late final StreamController<List<YahooFinanceCandleData>> streamController;
  late Stream<List<YahooFinanceCandleData>> stream =
      Stream.periodic(Duration(seconds: 10))
          .asyncMap((event) async => await getMajorIndexTickerDataOfTicker());

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

  Future<List<YahooFinanceCandleData>> getMajorIndexTickerDataOfTicker() async {
    indexPriceList.clear();
    DateTime? dateToFetch =
        isValidTradeDay(DateTime.now()) && isValidTimeRange(StockTime.Indian)
            ? DateTime.now()
            : lastOpenTime();

    // DateTime dateToFetch = DateTime(DateTime.now().year, DateTime.now().month,
    //     DateTime.now().day, 12, 0, 0);
    // dateToFetch = dateToFetch.subtract(Duration(days: 3));
    print("Date to Fetch - $dateToFetch");

    final NSEPrice = await YahooFinanceService().getTickerData(
      '^NSEI',
      startDate: dateToFetch,
      adjust: true,
    );
    print("NSE = ${NSEPrice}");

    final BSEPrice = await YahooFinanceService().getTickerData(
      '^BSESN',
      startDate: dateToFetch,
      adjust: true,
    );

    print("BSE = ${BSEPrice}");

    if (NSEPrice.isNotEmpty && BSEPrice.isNotEmpty) {
      indexPriceList.add(NSEPrice.first);
      indexPriceList.add(BSEPrice.first);
      print(
          "Ticker : NSE = ${indexPriceList[0].adjClose}, BSE = ${indexPriceList[1].adjClose}");
    }

    return indexPriceList;
  }

  Future<List<YahooFinanceCandleData>> getDataOfTicker(String ticker) async {
    DateTime? dateToFetch =
        isValidTradeDay(DateTime.now()) && isValidTimeRange(StockTime.Indian)
            ? DateTime.now()
            : lastOpenTime();
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

  DateTime lastOpenTime() {
    // Set initial time to 4pm today
    DateTime result =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    while (!isValidTradeDay(result)) {
      // Check if today is a holiday
      if (DateTimeUtils().checkForHolidayOnDate(result)) {
        print("Today is a holiday");
        result = result.subtract(const Duration(days: 1));
      }
      // Return 4pm last Friday if today is Sunday or Saturday
      if (result.weekday == 7) {
        // Sunday
        print("Today is a Sunday");
        result = result.subtract(const Duration(days: 2));
      } else if (result.weekday == 6) {
        // Saturday
        print("Today is a Saturday");
        result = result.subtract(const Duration(days: 1));
      }
    }

    // its after 4pm on a trading day
    // if (result.hour > 16) {
    //   return result;
    // } else if (result.hour < 9) {
    //   // If its before 9 am on a Monday, return 4pm last Friday
    //   if (DateTime.now().weekday == 1) {
    //     result = result.subtract(Duration(days: 3));
    //   } else {
    //     // Its before 9 am on a trading day
    //     result = result.subtract(const Duration(days: 1));
    //   }
    //   return result;
    // }
    return result;
  }

  bool isValidTradeDay(DateTime date) {
    bool isWeekday = date.weekday >= 1 && date.weekday <= 5;
    bool isHoliday = DateTimeUtils().checkForHolidayOnDate(date);

    return isWeekday && !isHoliday;
  }

  // void _startIndexPriceStream() async {
  //   Timer.periodic(
  //       Duration(seconds: 10), (Timer t) => getMajorIndexTickerDataOfTicker());
  // }
}
