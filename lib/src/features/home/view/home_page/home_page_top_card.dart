import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class HomeScreenTopCard extends StatelessWidget {
  const HomeScreenTopCard({
    super.key,
    required this.homePageViewModel,
  });

  final HomePageViewModel homePageViewModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: size.width,
        height: size.height / 4.5,
        decoration: BoxDecoration(
          color: mDarkBlue,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 30,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: StreamBuilder<List<YahooFinanceCandleData>>(
              stream: homePageViewModel.streamController.stream,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("NSE",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14)),
                    Row(
                      children: [
                        Text(
                            homePageViewModel.nullorEmptySafeText_AdjClose(
                                snapshot.data, Indices.NSE),
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22)),
                        Text(" (${homePageViewModel.nullorEmptySafeText_DayDiffPercent(snapshot.data, Indices.NSE)})",
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
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14)),
                    Row(
                      children: [
                        Text(
                            homePageViewModel.nullorEmptySafeText_AdjClose(
                                snapshot.data, Indices.BSE),
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22)),
                        Text(" (${homePageViewModel.nullorEmptySafeText_DayDiffPercent(snapshot.data, Indices.BSE)})",
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
