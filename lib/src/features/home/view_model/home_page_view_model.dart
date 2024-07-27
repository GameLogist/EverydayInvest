// ignore_for_file: non_constant_identifier_names

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

enum Indices {
  NSE(0),
  BSE(1);

  const Indices(this.idx);
  final int idx;
}

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

  late StreamController<List<YahooFinanceCandleData>> streamController;
  late Stream<List<YahooFinanceCandleData>> stream;

  @override
  void onInit() {
    super.onInit();

    streamController =
        StreamController<List<YahooFinanceCandleData>>.broadcast();

    print("Starting a stream!");
    // startIndexStream();
    // stream = Stream.periodic(Duration(seconds: 10))
    //     .asyncMap((event) async => await getMajorIndexTickerDataOfTicker());

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

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  startIndexStream() {
    print("startIndexStream");
    const period = Duration(seconds: 10);
    Timer.periodic(period, (Timer t) => loadData());
  }

  loadData() {
    getMajorIndexTickerDataOfTicker().then((value) async {
      print("loadData");
      streamController.add(value);
      return value;
    });
  }

  closeAllStreams() {
    streamController.close();
  }

  Future<List<YahooFinanceCandleData>> getMajorIndexTickerDataOfTicker() async {
    DateTime rightNow = DateTime.now();
    // DateTime rightNow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0, 0);
    print("Now- $rightNow");
    DateTime dateToFetch = isValidTradeDay(rightNow) &&
            isValidTimeRange(rightNow, StockTime.Indian)
        ? rightNow
        : lastOpenTime();
    print("Date to Fetch - $dateToFetch");

    final NSEPrice = await YahooFinanceService().getTickerData(
      '^NSEI',
      startDate: dateToFetch,
      adjust: true,
    );
    if (NSEPrice.isNotEmpty) {
      print("NSE = $NSEPrice");
    } else {
      print("NSE is empty");
    }

    final BSEPrice = await YahooFinanceService().getTickerData(
      '^BSESN',
      startDate: dateToFetch,
      adjust: true,
    );

    if (BSEPrice.isNotEmpty) {
      print("BSE = $BSEPrice");
    } else {
      print("BSE is empty");
    }

    if (NSEPrice.isNotEmpty && BSEPrice.isNotEmpty) {
      indexPriceList = [NSEPrice.first, BSEPrice.first];
      print(
          "Ticker : NSE = ${indexPriceList[0].adjClose}, BSE = ${indexPriceList[1].adjClose}");
    }

    return indexPriceList;
  }

  Future<List<YahooFinanceCandleData>> getDataOfTicker(String ticker) async {
    DateTime rightNow = DateTime.now();
    DateTime dateToFetch =
        isValidTradeDay(rightNow) && !isBeforeMarketLive(rightNow)
            ? rightNow
            : lastOpenTime();
    final tickerPrice = await YahooFinanceService().getTickerData(
      ticker,
      startDate: dateToFetch,
      adjust: true,
    );

    print("Ticker : $ticker = ${indexPriceList[0].adjClose}");

    return tickerPrice;
  }

  // https://query2.finance.yahoo.com/v8/finance/chart/GOOG
  Future<List<YahooFinanceCandleData>> getTickerDataList(String ticker) async {
    DateTime rightNow = DateTime.now();
    DateTime dateToFetch =
        isValidTradeDay(rightNow) && !isBeforeMarketLive(rightNow)
            ? rightNow
            : lastOpenTime();
    final tickerPrice = await YahooFinanceService().getTickerDataList(
      ['COALINDIA.NS', 'HDFCBANK.NS'],
    );

    if (tickerPrice.isNotEmpty) {
      print("tickerPrice = $tickerPrice");
    } else {
      print("tickerPrice is empty");
    }
    return tickerPrice;
  }

  bool isValidTimeRange(DateTime time, StockTime timeType) {
    TimeOfDay startTime = timeType == StockTime.Indian
        ? TimeOfDay(hour: 9, minute: 30)
        : TimeOfDay(hour: 19, minute: 0);
    TimeOfDay endTime = timeType == StockTime.Indian
        ? TimeOfDay(hour: 16, minute: 0)
        : TimeOfDay(hour: 24, minute: 0);
    return ((time.hour > startTime.hour) ||
            (time.hour == startTime.hour && time.minute >= startTime.minute)) &&
        ((time.hour < endTime.hour) ||
            (time.hour == endTime.hour && time.minute <= endTime.minute));
  }

  bool isBeforeMarketLive(DateTime date) {
    print("isBeforeMarketLive");
    TimeOfDay now = TimeOfDay.now();
    return ((now.hour < 9) || (now.hour == 9 && now.minute <= 30));
  }

  DateTime lastOpenTime() {
    print("lastOpenTime");
    // Set initial time to 4pm today
    DateTime result =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    if (isBeforeMarketLive(DateTime.now())) {
      print("Trading has not begun today, getting data for yesterday");
      result = result.subtract(const Duration(days: 1));
    }

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
    print(result);
    return result;
  }

  bool isValidTradeDay(DateTime date) {
    bool isWeekday = date.weekday >= 1 && date.weekday <= 5;
    bool isHoliday = DateTimeUtils().checkForHolidayOnDate(date);

    return isWeekday && !isHoliday;
  }

  nullorEmptySafeText_AdjClose(
      List<YahooFinanceCandleData>? data, Indices indice) {
    if (data != null) {
      var length = data.length;
      if (length != 0) {
        return data[indice.idx].adjClose.toStringAsFixed(2).toString();
      }
    }
    return "Loading...";
  }

  nullorEmptySafeText_DayDiffPercent(
      List<YahooFinanceCandleData>? data, Indices indice) {
    if (data != null) {
      var length = data.length;
      if (length != 0) {
        num percent = (data[indice.idx].adjClose - data[indice.idx].open) /
            data[indice.idx].open *
            100;
        percent = num.parse(percent.toStringAsFixed(2));
        return percent >= 0 ? "+$percent%" : "$percent%";
      }
    }
    return "";
  }

  // void _startIndexPriceStream() async {
  //   Timer.periodic(
  //       Duration(seconds: 10), (Timer t) => getMajorIndexTickerDataOfTicker());
  // }
}
