import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:everyday_invest/src/features/home/view_model/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageViewModel homePageViewModel = Get.put(HomePageViewModel());
    final size = MediaQuery.of(context).size;
    return Container(
      color: mBeige,
      child: Stack(
        children: [
          HomeScreenBottomCard(
            size: size,
            homePageViewModel: homePageViewModel,
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeScreenHeader(),
              const SizedBox(
                height: 10,
              ),
              HomeScreenTopCard(),
            ],
          ),
        ],
      ),
    );
  }
}

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
              topRight: Radius.circular(32), topLeft: Radius.circular(32)),
          child: Container(
            width: size.width,
            height: size.height,
            color: Color(0xFF5e4386),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: size.height / 7),
                  Container(
                    child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white38,
                        isScrollable: true,
                        // labelPadding: const EdgeInsets.only(left: 12, right: 12),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(255, 74, 52, 105)),
                        controller: homePageViewModel.tabController,
                        tabs: homePageViewModel.homeBottomWidgetTabs),
                  ),
                  Container(
                    width: size.width,
                    height: 300,
                    child: TabBarView(
                        controller: homePageViewModel.tabController,
                        children: [
                          for (var stockList
                              in homePageViewModel.homePageStockInfo)
                            ListView.builder(
                                itemCount: stockList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                      leading:Text(
                                        stockList[index].ticker.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),,
                                      trailing: Text(
                                        stockList[index].price.toString(),
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 15),
                                      ),
                                      title:Text(
                                        stockList[index].name.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),);
                                })
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 72, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hi, Ayush Tiwari",
              style: GoogleFonts.nunito(
                  color: Color(0xFFb296c6),
                  fontWeight: FontWeight.w700,
                  fontSize: 22)),
          Text("Market Live", style: TextStyle(color: Colors.red))
        ],
      ),
    );
  }
}

class HomeScreenTopCard extends StatelessWidget {
  const HomeScreenTopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: size.width,
        height: size.height / 4.5,
        decoration: BoxDecoration(
          color: Color(0xFFfea8a7),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("NSE",
                  style: GoogleFonts.nunito(
                      color: Color(0xFF8b4c5f),
                      fontWeight: FontWeight.w700,
                      fontSize: 14)),
              Row(
                children: [
                  Text("21,126",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22)),
                  Text(" (+2.3%)",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text("BSE",
                  style: GoogleFonts.nunito(
                      color: Color(0xFF8b4c5f),
                      fontWeight: FontWeight.w700,
                      fontSize: 14)),
              Row(
                children: [
                  Text("71,347",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22)),
                  Text(" (+2.15%)",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
