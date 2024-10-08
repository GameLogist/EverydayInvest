import 'dart:ffi';

import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:everyday_invest/src/utils/fl_charts/price_points.dart';
import 'package:get/get.dart';

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

  fetchFinancials() {
    cagr = 23.8.obs;
    pe = 23.0.obs;
    eps = 42.82.obs;
    marketCap = 23456.0.obs;
  }
}
