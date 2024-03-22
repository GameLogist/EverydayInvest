import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view/home_page/home_page_bottom_card.dart';
import 'package:everyday_invest/src/features/home/view/home_page/home_page_header.dart';
import 'package:everyday_invest/src/features/home/view/home_page/home_page_top_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:everyday_invest/src/features/home/view_model/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageViewModel homePageViewModel = Get.put(HomePageViewModel());
    final size = MediaQuery.of(context).size;
    return Container(
      color: mTertiaryColor,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            HomeScreenBottomCard(
              size: size,
              homePageViewModel: homePageViewModel,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeScreenHeader(
                  homePageViewModel: homePageViewModel,
                ),
                const SizedBox(
                  height: 10,
                ),
                HomeScreenTopCard(
                  homePageViewModel: homePageViewModel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
