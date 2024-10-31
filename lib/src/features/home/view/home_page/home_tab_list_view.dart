

import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view/home_page/stock_tile.dart';
import 'package:everyday_invest/src/features/home/view/stock_detail_page/stock_details_view.dart';
import 'package:everyday_invest/src/features/home/view_model/home_page_view_model.dart';
import 'package:everyday_invest/src/utils/enums/StockEnums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeTabListView extends StatelessWidget {
  final HomeListType type;
  final HomePageViewModel homePageViewModel;

  const HomeTabListView(
      {super.key, required this.type, required this.homePageViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Obx(
          () => homePageViewModel.getHomeTabList(type).length == 0
              ? Center(
                  child: LoadingAnimationWidget.stretchedDots(
                  color: mDarkBlue,
                  size: 50,
                ))
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: homePageViewModel.getHomeTabList(type).length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => StockDetailsView(
                              stock:
                                  homePageViewModel.getHomeTabList(type)[index],
                            ));
                      },
                      child: StockListTile(
                          name: homePageViewModel
                              .getHomeTabList(type)[index]
                              .name
                              .toString(),
                          ticker: homePageViewModel
                              .getHomeTabList(type)[index]
                              .ticker
                              .toString(),
                          price: homePageViewModel
                              .getHomeTabList(type)[index]
                              .price
                              .toString(),
                          percentChange: homePageViewModel
                              .getHomeTabList(type)[index]
                              .percentChange),
                    );
                  }),
        ),
      ),
    );
  }
}