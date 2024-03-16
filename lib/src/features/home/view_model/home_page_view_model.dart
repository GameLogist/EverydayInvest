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

  final List<List<StockInfo>> homePageStockInfo =
      TestData().homePageStockInfoTest;
  final List<StockInfo> homeTopGainers = TestData().homeTopGainersTest;
  final List<StockInfo> homeTopLosers = TestData().homeTopLosersTest;

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
