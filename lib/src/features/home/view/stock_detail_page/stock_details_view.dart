import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/home/model/home_page_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class StockDetailsView extends StatelessWidget {
  const StockDetailsView({super.key, required this.stock});

  final StockInfo stock;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text("Stock Info",
            style: GoogleFonts.nunito(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height / 9,
              width: size.width,
              color: mPrimaryBackground,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(48, 20, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stock.name,
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                    Text(stock.type.text,
                        style: GoogleFonts.nunito(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14)),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(48, 24, 48, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mCurrentPrice,
                        style: GoogleFonts.nunito(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Text("\u{20B9} ${stock.price.toString()}",
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26)),
                          SizedBox(
                            width: 24,
                          ),
                          Text("+2.9%",
                              style: GoogleFonts.nunito(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mCAGR,
                                  style: GoogleFonts.nunito(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                              Text("+23.8%",
                                  style: GoogleFonts.nunito(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26))
                            ],
                          ),
                          SizedBox(
                            width: 128,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mPE,
                                  style: GoogleFonts.nunito(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                              Text("23",
                                  style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mMarketCap,
                                  style: GoogleFonts.nunito(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                              Text("234551",
                                  style: GoogleFonts.nunito(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26))
                            ],
                          ),
                          SizedBox(
                            width: 128,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mEPS,
                                  style: GoogleFonts.nunito(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                              Text("41.82",
                                  style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
