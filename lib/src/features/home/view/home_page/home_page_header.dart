import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view_model/home_page_view_model.dart';
import 'package:everyday_invest/src/utils/enums/StockEnums.dart';
import 'package:everyday_invest/src/utils/util_funtions/DateTimeUtils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
    required this.homePageViewModel,
  });

  final HomePageViewModel homePageViewModel;

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
                  color: mDarkBlue, fontWeight: FontWeight.w700, fontSize: 22)),
          Text(
              DateTimeUtils().isValidTimeRange(DateTime.now(), StockTime.Indian)
                  ? "Market Live"
                  : "Market Close",
              style: GoogleFonts.nunito(
                  color: DateTimeUtils().isValidTimeRange(DateTime.now(), StockTime.Indian)
                      ? Colors.red
                      : Colors.black,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
