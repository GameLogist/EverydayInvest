import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:everyday_invest/src/utils/fl_charts/price_points.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class StockDetailsPageViewModel extends GetxController {
  static StockDetailsPageViewModel get instance => Get.find();
  List<PricePoint> stockPricaData = [];
  StockInfo stock;
  Rx<double> cagr = 0.0.obs;
  Rx<double> pe = 0.0.obs;
  Rx<double> eps = 0.0.obs;
  Rx<double> marketCap = 0.0.obs;

  StockDetailsPageViewModel(this.stock);

  @override
  void onInit() {
    super.onInit();
    fetchStockPrice();
    fetchFinancials();
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
    final response = await http.Client()
        .get(Uri.parse('https://www.google.com/finance/markets/gainers'));

    if (response.statusCode == 200) {
      //Getting the html document from the response

      var document = parser.parse(response.body);
      try {
        //Scraping the first article title
        var responseString1 = document.getElementsByClassName('sbnBtf')[0];

        print("Response - ${responseString1.text}");
        var compList = responseString1.text.split('add_circle_outline');
        print(compList);
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
}
