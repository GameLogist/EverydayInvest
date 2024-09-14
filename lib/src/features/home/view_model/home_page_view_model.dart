// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:everyday_invest/src/testing/test_data.dart';
import 'package:everyday_invest/src/utils/enums/StockEnums.dart';
import 'package:everyday_invest/src/utils/util_funtions/DateTimeUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class HomePageViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> homeBottomWidgetTabs = [];

  final List<List<StockInfo>> homePageStockInfo =
      TestData().homePageStockInfoTest;
  RxList<StockInfo> homeTopGainers = <StockInfo>[].obs;
  RxList<StockInfo> homeTopLosers = <StockInfo>[].obs;

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

    fetchTopGainers();
    fetchTopLosers();
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
    DateTime dateToFetch = DateTimeUtils().isValidTradeDay(rightNow) &&
            DateTimeUtils().isValidTimeRange(rightNow, StockTime.Indian)
        ? rightNow
        : DateTimeUtils().lastOpenTime();
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
    DateTime dateToFetch = DateTimeUtils().isValidTradeDay(rightNow) &&
            !DateTimeUtils().isBeforeMarketLive(rightNow)
        ? rightNow
        : DateTimeUtils().lastOpenTime();
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
    DateTime dateToFetch = DateTimeUtils().isValidTradeDay(rightNow) &&
            !DateTimeUtils().isBeforeMarketLive(rightNow)
        ? rightNow
        : DateTimeUtils().lastOpenTime();
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

  // HTTP WEB SRAPING
  Future<bool> fetchTopGainers() async {
    homeTopGainers.clear();
    final response = await http.Client()
        .get(Uri.parse('https://www.google.com/finance/markets/gainers'));

    if (response.statusCode == 200) {
      //Getting the html document from the response

      var document = parser.parse(response.body);
      try {
        //Scraping the first article title
        var responseString1 = document.getElementsByClassName('sbnBtf')[0];

        // print("Response - ${responseString1.text}");
        var compList = responseString1.text.split('add_circle_outline');
        // print("Length - ${compList.length} : ${compList}");
        for (var stock in compList) {
          final (stockName, ticker, currentPrice, percentChange) =
              parseGainerData(stock);

          homeTopGainers.add(StockInfo(
              name: stockName,
              ticker: ticker,
              price: double.parse(currentPrice),
              type: StockType.indianStock,
              percentChange: percentChange));
        }
        homeTopGainers.refresh();
        return true;
      } catch (e) {
        print('ERROR: ${response.statusCode}.');
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> fetchTopLosers() async {
    homeTopLosers.clear();
    final response = await http.Client()
        .get(Uri.parse('https://www.google.com/finance/markets/losers'));

    if (response.statusCode == 200) {
      //Getting the html document from the response

      var document = parser.parse(response.body);
      try {
        //Scraping the first article title
        var responseString1 = document.getElementsByClassName('sbnBtf')[0];

        // print("Response - ${responseString1.text}");
        var compList = responseString1.text.split('add_circle_outline');
        // print("Length - ${compList.length} : ${compList}");
        for (var stock in compList) {
          final (stockName, ticker, currentPrice, percentChange) =
              parseGainerData(stock);

          homeTopLosers.add(StockInfo(
              name: stockName,
              ticker: ticker,
              price: double.parse(currentPrice),
              type: StockType.indianStock,
              percentChange: percentChange));
        }
        homeTopLosers.refresh();
        return true;
      } catch (e) {
        print('ERROR: ${response.statusCode}.');
        return false;
      }
    } else {
      return false;
    }
  }

  (String, String, String, String) parseGainerData(String data) {
    print(data);
    // Input = ATAL-REAtal Realtech Rights₹0.32+₹0.09039.13%
    final splittedByRs = data.split('₹');

    if (splittedByRs.length != 3) {
      print("Data not proper!");
      return ("", "", "", "");
    }

    // splittedByRs = ["ATAL-REAtal Realtech Rights" , "0.32+" , "0.09039.13%"]
    var stockNameAndTicker = splittedByRs[0];
    var charArray = stockNameAndTicker.split('');
    var stockName = "";
    var ticker = "";
    for (int i = 0; i < charArray.length; i++) {
      if (charArray[i].codeUnitAt(0) >= 97 &&
          charArray[i].codeUnitAt(0) <= 122) {
        ticker = stockNameAndTicker.substring(0, i - 1);
        stockName =
            stockNameAndTicker.substring(i - 1, stockNameAndTicker.length);
        break;
      }
    }
    var plauOrMinus = splittedByRs[1][splittedByRs[1].length - 1];
    final currentPrice = splittedByRs[1]
        .substring(0, splittedByRs[1].length - 1)
        .replaceAll(RegExp(r','), '');

    var splitter = splittedByRs[2].indexOf('.');
    final absoluteChange = splittedByRs[2].substring(0, splitter + 3);
    var percentChange = plauOrMinus + 
        splittedByRs[2].substring(splitter + 3, splittedByRs[2].length - 1);

    print(
        "Stock Name - ${stockName}, Ticker - ${ticker}, Price - ${currentPrice}, Change - ${percentChange}");

    return (stockName, ticker, currentPrice, percentChange);
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
}
