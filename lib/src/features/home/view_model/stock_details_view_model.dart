import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:everyday_invest/src/utils/fl_charts/price_points.dart';
import 'package:everyday_invest/src/utils/util_funtions/DateTimeUtils.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class StockDetailsPageViewModel extends GetxController {
  static StockDetailsPageViewModel get instance => Get.find();
  StockInfo stock;
  Rx<bool> loading = false.obs;
  RxList<PricePoint> stockPricaData = <PricePoint>[].obs;
  Rx<String> cagr = '-'.obs;
  Rx<String> avgVolume = '-'.obs;
  Rx<String> marketCap = '-'.obs;
  Rx<String> pe = '-'.obs;
  Rx<String> dividendYield = '-'.obs;

  Rx<String> aboutText = '-'.obs;
  Rx<String> ceoName = '-'.obs;
  Rx<String> foundedDate = '-'.obs;
  Rx<String> employeeCount = '-'.obs;

  Rx<String> revenue = '-'.obs;
  Rx<String> opExp = '-'.obs;
  Rx<String> netIncome = '-'.obs;
  Rx<String> netProfitMargin = '-'.obs;
  Rx<String> eps = '-'.obs;
  Rx<String> ebitda = '-'.obs;
  Rx<String> effTaxRate = '-'.obs;

  Rx<String> cashAndSTI = '-'.obs; // Cash and Short Term Investments
  Rx<String> totalAssets = '-'.obs;
  Rx<String> totalLiablilities = '-'.obs;
  Rx<String> totalEquity = '-'.obs;
  Rx<String> sharesOutstanding = '-'.obs;
  Rx<String> priceToBook = '-'.obs;
  Rx<String> returnOnAssets = '-'.obs;
  Rx<String> returnOnCapital = '-'.obs;

  StockDetailsPageViewModel(this.stock);

  @override
  void onInit() {
    super.onInit();
    fetchFinancials();
    getDataOfTicker(stock.ticker);
  }

  // HTTP WEB SRAPING
  Future<bool> fetchFinancials() async {
    loading.value = true;
    final url = 'https://www.google.com/finance/quote/${stock.ticker}:NSE';
    print(url);
    final response = await http.Client().get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Getting the html document from the response

      var document = parser.parse(response.body);
      try {
        // Stock Details(Table 1)
        var table1 = document.getElementsByClassName('eYanAe')[0];
        print("Table 1 $table1");
        var previousClose = table1.getElementsByClassName('P6K39c')[0];
        print("previousClose - ${previousClose.text}");
        var marketCap =
            table1.getElementsByClassName('P6K39c')[3].text.split(' ')[0];
        print("marketCap - ${marketCap}");
        var avgVolume = table1.getElementsByClassName('P6K39c')[4];
        print("avgVolume - ${avgVolume.text}");
        var peRatio = table1.getElementsByClassName('P6K39c')[5];
        print("peRatio - ${peRatio.text}");
        var dividendYield = table1.getElementsByClassName('P6K39c')[6];
        print("dividendYield - ${dividendYield.text}");

        // About(Table 2)
        // var table2 = document.getElementsByClassName('w4txWc oJeWuf')[0];
        // print("Table 2 $table2");
        // for (var i = 1; i < table2.children.length; i++) {
        //   if (table2.children[i].className == 'gyFHrc') {
        //     var item = table2.children[i];
        //     print(item.children[0].text);
        //     if (item.children[0].text == "CEO") {
        //       print("CEO is - ");
        //     }
        //   }
        // }

        // var ceoName = document.getElementsByClassName('tBHE4e')[1];
        // print("ceoName - ${ceoName.text}");
        // var foundedIn = document.getElementsByClassName('P6K39c')[9];
        // print("foundedIn - ${foundedIn.text}");
        // var employeeCount = document.getElementsByClassName('P6K39c')[11];
        // print("employeeCount - ${employeeCount.text}");

        // Income Statement
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

        // Balance Sheet
        var cashAndSTI = document.getElementsByClassName('QXDnM')[7];
        print("cashAndSTI - ${cashAndSTI.text}");
        var totalAssets = document.getElementsByClassName('QXDnM')[8];
        print("totalAssets - ${totalAssets.text}");
        var totalLiabilities = document.getElementsByClassName('QXDnM')[9];
        print("totalLiabilities - ${totalLiabilities.text}");
        var totalEquity = document.getElementsByClassName('QXDnM')[10];
        print("totalEquity - ${totalEquity.text}");
        var sharesOutstanding = document.getElementsByClassName('QXDnM')[11];
        print("sharesOutstanding - ${sharesOutstanding.text}");
        var priceToBook = document.getElementsByClassName('QXDnM')[12];
        print("priceToBook - ${priceToBook.text}");
        var returnOnAssets = document.getElementsByClassName('QXDnM')[13];
        print("returnOnAssets - ${returnOnAssets.text}");
        var returnOnCapital = document.getElementsByClassName('QXDnM')[14];
        print("returnOnCapital - ${returnOnCapital.text}");

        // Update UI
        this.marketCap.value = marketCap;
        this.avgVolume.value = avgVolume.text;
        this.pe.value = peRatio.text;
        this.dividendYield.value = dividendYield.text;

        this.revenue.value = revenue.text;
        this.opExp.value = opExp.text;
        this.netIncome.value = netIncome.text;
        this.netProfitMargin.value = netProfitMargin.text;
        this.eps.value = eps.text;
        this.ebitda.value = ebitda.text;
        this.effTaxRate.value = effTaxRate.text;

        this.cashAndSTI.value = cashAndSTI.text;
        this.totalAssets.value = totalAssets.text;
        this.totalLiablilities.value = totalLiabilities.text;
        this.totalEquity.value = totalEquity.text;
        this.sharesOutstanding.value = sharesOutstanding.text;
        this.priceToBook.value = priceToBook.text;
        this.returnOnAssets.value = returnOnAssets.text;
        this.returnOnCapital.value = returnOnCapital.text;

        loading.value = false;
        return true;
      } catch (e) {
        print('ERROR: ${response.statusCode}.');
        loading.value = false;
        return false;
      }
    } else {
      loading.value = false;
      return false;
    }
  }

  void getDataOfTicker(String ticker) async {
    loading.value = true;
    print("Ticker = ${ticker}");
    DateTime dateToFetch = DateTime(2024, 1, 1);
    final tickerPrice = await YahooFinanceService().getTickerData(
      '$ticker.NS',
      startDate: dateToFetch,
      adjust: true,
    );

    loading.value = false;
    var entries = tickerPrice.length;
    print("No. of entries = ${entries}");
    if (entries > 0) {
      print("Sample entry = ${tickerPrice[0]}");
    } else {
      print("Data not found or cant be fetched!");
      return;
    }
    for (var dataPoint in tickerPrice) {
      stockPricaData.add(PricePoint(
          x: dataPoint.date.millisecondsSinceEpoch.toDouble(),
          y: dataPoint.close.toPrecision(2)));
    }
  }
}
