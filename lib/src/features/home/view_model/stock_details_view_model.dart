import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:everyday_invest/src/utils/fl_charts/price_points.dart';
import 'package:everyday_invest/src/utils/util_funtions/DateTimeUtils.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class StockDetailsPageViewModel extends GetxController {
  static StockDetailsPageViewModel get instance => Get.find();
  List<PricePoint> stockPricaData = [];
  StockInfo stock;
  Rx<String> cagr = '-'.obs;
  Rx<String> pe = '-'.obs;
  Rx<String> eps = '-'.obs;
  Rx<String> marketCap = '-'.obs;

  StockDetailsPageViewModel(this.stock);

  @override
  void onInit() {
    super.onInit();
    fetchStockPrice();
    fetchFinancials();
    getDataOfTicker(stock.ticker);
  }

  fetchStockPrice() {
    stockPricaData = [
      PricePoint(x: 2018, y: 12344),
      PricePoint(x: 2019, y: 12445),
      PricePoint(x: 2020, y: 12600),
      PricePoint(x: 2021, y: 13001),
      PricePoint(x: 2022, y: 12330),
      PricePoint(x: 2023, y: 14322)
    ];
  }

  /*
  Future<bool> fetchFinancials() async {
    var baseUrl = 'https://www.alphavantage.co/query?';
    var queryType = 'function=OVERVIEW';
    var keyword = '&keywords=HDFCBANK';
    var apiKey = '&apikey=F93FME1U64RCBDPD';

    var finalUrl = baseUrl + queryType + keyword + apiKey;
    print(finalUrl);
    final response = await http.Client().get(Uri.parse('${finalUrl}'));

    if (response.statusCode == 200) {
      print(response.body);
    } else { 
      print("Error");
    }
    return true;
  }
  */

  // HTTP WEB SRAPING
  Future<bool> fetchFinancials() async {
    final url = 'https://www.google.com/finance/quote/${stock.ticker}:NSE';
    print(url);
    final response = await http.Client().get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Getting the html document from the response

      var document = parser.parse(response.body);
      try {
        // About
        var aboutText = document.getElementsByClassName('bLLb2d')[0];
        print("aboutText - ${aboutText.text}");
        var ceoName = document.getElementsByClassName('tBHE4e')[1];
        print("ceoName - ${ceoName.text}");
        var foundedIn = document.getElementsByClassName('P6K39c')[9];
        print("foundedIn - ${foundedIn.text}");  
        var employeeCount = document.getElementsByClassName('P6K39c')[11];
        print("employeeCount - ${employeeCount.text}");

        // Stock Details
        var previousClose = document.getElementsByClassName('P6K39c')[0];
        print("previousClose - ${previousClose.text}");
        var marketCap =
            document.getElementsByClassName('P6K39c')[3].text.split(' ')[0];
        print("marketCap - ${marketCap}");
        var avgVolume = document.getElementsByClassName('P6K39c')[4];
        print("avgVolume - ${avgVolume.text}");

        var revenue = document.getElementsByClassName('QXDnM')[0];
        print("revenue - ${revenue.text}");
        var opExp = document.getElementsByClassName('QXDnM')[1];
        print("opExp - ${opExp.text}");
        var netIncome = document.getElementsByClassName('QXDnM')[2];
        print("netIncome - ${netIncome.text}");
        var netProfitMargin = document.getElementsByClassName('QXDnM')[3];
        print("netProfitMargin - ${netProfitMargin.text}");
        var eps = document.getElementsByClassName('QXDnM')[4];
        print("eps - ${eps.text}");
        var ebitda = document.getElementsByClassName('QXDnM')[5];
        print("ebitda - ${ebitda.text}");
        var effTaxRate = document.getElementsByClassName('QXDnM')[6];
        print("effTaxRate - ${effTaxRate.text}");

        var cashAndSTI = document.getElementsByClassName('QXDnM')[7];
        print("cashAndSTI - ${cashAndSTI.text}");
        var totalAssets = document.getElementsByClassName('QXDnM')[8];
        print("totalAssets - ${totalAssets.text}");
        var totalLiabilities = document.getElementsByClassName('QXDnM')[9];
        print("totalLiabilities - ${totalLiabilities.text}");
        var returnOnAssets = document.getElementsByClassName('QXDnM')[13];
        print("returnOnAssets - ${returnOnAssets.text}");
        var returnOnCapital = document.getElementsByClassName('QXDnM')[14];
        print("returnOnCapital - ${returnOnCapital.text}");

        // Update UI
        this.marketCap.value = marketCap;
        this.eps.value = eps.text;
        return true;
      } catch (e) {
        print('ERROR: ${response.statusCode}.');
        return false;
      }
    } else {
      return false;
    }

    // cagr = 23.8.obs;
    // pe = 23.0.obs;
    // eps = 42.82.obs;
    // marketCap = 23456.0.obs;

    // return true;
  }

  Future<List<YahooFinanceCandleData>> getDataOfTicker(String ticker) async {
    print("Ticker = ${ticker}");
    // DateTime rightNow = DateTime.now();
    // DateTime dateToFetch = DateTimeUtils().isValidTradeDay(rightNow) &&
    //         !DateTimeUtils().isBeforeMarketLive(rightNow)
    //     ? rightNow
    //     : DateTimeUtils().lastOpenTime();
    DateTime dateToFetch = DateTime(2024, 1, 1);
    final tickerPrice = await YahooFinanceService().getTickerData(
      ticker,
      startDate: dateToFetch,
      adjust: true,
    );

    var entries = tickerPrice.length;
    print("No. of entries = ${entries}");
    if(entries > 0) {
      print("Sample entry = ${tickerPrice[0]}");
    }
    // print("Ticker : $ticker = $tickerPrice");

    return tickerPrice;
  }
}
