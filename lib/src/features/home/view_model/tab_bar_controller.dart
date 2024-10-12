import 'package:everyday_invest/src/utils/enums/StockEnums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabViewController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: HomeListType.indianStock.text),
    Tab(text: HomeListType.usStocks.text),
    Tab(text: HomeListType.indices.text),
    Tab(text: HomeListType.etfs.text)
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}