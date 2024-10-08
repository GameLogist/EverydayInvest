import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view/home_page/stock_tile.dart';
import 'package:everyday_invest/src/features/home/view/stock_detail_page/stock_details_view.dart';
import 'package:everyday_invest/src/features/home/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenBottomCard extends StatelessWidget {
  HomeScreenBottomCard({
    super.key,
    required this.size,
    required this.homePageViewModel,
  });

  final Size size;
  final HomePageViewModel homePageViewModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.5),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, size.height / 4, 0, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          child: Container(
            width: size.width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: size.height / 7),
                TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    // labelPadding: const EdgeInsets.only(left: 12, right: 12),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: mDarkBlue),
                    controller: homePageViewModel.tabController,
                    tabs: homePageViewModel.homeBottomWidgetTabs),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: size.width,
                    height: size.height / 2,
                    child: TabBarView(
                        controller: homePageViewModel.tabController,
                        children: [
                          for (var stockList
                              in homePageViewModel.homePageStockInfo)
                            ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: stockList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => StockDetailsView(stock: stockList[index],));
                                    },
                                    child: StockListTile(
                                        name: stockList[index].name.toString(),
                                        ticker:
                                            stockList[index].ticker.toString(),
                                        price: stockList[index].price.toString()),
                                  );
                                })
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      color: mBeigePink,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Column(
                          children: [
                            Text("Top Gainers",
                                style: GoogleFonts.nunito(
                                    color: mDarkBlue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22)),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount:
                                        homePageViewModel.homeTopGainers.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return StockListTile(
                                          name: homePageViewModel
                                              .homeTopGainers[index].name
                                              .toString(),
                                          ticker: homePageViewModel
                                              .homeTopGainers[index].ticker
                                              .toString(),
                                          price: homePageViewModel
                                              .homeTopGainers[index].price
                                              .toString());
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      color: mLavender,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Column(
                          children: [
                            Text("Top Losers",
                                style: GoogleFonts.nunito(
                                    color: mDarkBlue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22)),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount:
                                        homePageViewModel.homeTopLosers.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return StockListTile(
                                          name: homePageViewModel
                                              .homeTopLosers[index].name
                                              .toString(),
                                          ticker: homePageViewModel
                                              .homeTopLosers[index].ticker
                                              .toString(),
                                          price: homePageViewModel
                                              .homeTopLosers[index].price
                                              .toString());
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
