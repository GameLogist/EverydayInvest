import 'package:everyday_invest/src/common_widgets/fl_chart_widgets/line_chart_widget.dart';
import 'package:everyday_invest/src/common_widgets/fl_chart_widgets/pie_chart_widget.dart';
import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view_model/investments_page_view_model.dart';
import 'package:everyday_invest/src/utils/fl_charts/price_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class InvestmentsPage extends StatelessWidget {
  InvestmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InvestmentsPageViewModel investmentsPageViewModel =
        Get.put(InvestmentsPageViewModel());
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        color: mLavender,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(children: [
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("MY ASSETS",
                              style: GoogleFonts.nunito(
                                  color: mDarkBlue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)),
                          SizedBox(
                            height: 12,
                          ),
                          Text("\$23,123,112.06",
                              style: GoogleFonts.nunito(
                                  color: mDarkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black.withOpacity(0.2),
                      //     spreadRadius: 1,
                      //     blurRadius: 30,
                      //     offset: Offset(0, 2), // changes position of shadow
                      //   ),
                      // ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text("Net Worth Growth",
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          LineChartWidget(
                              points: investmentPortfolioGrowthTest),
                          SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text("Asset Allocation",
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: InvestmentAllocationList
                                          .values.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AllocationLegendListItemWidget(
                                          name: InvestmentAllocationList
                                              .values[index].text,
                                          dotColor: pastelColorArray[index %
                                              (pastelColorArray.length - 1)],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 200,
                                child: PieChartWidget(
                                    investmentsPageViewModel.pieChartSectors),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}

class AllocationLegendListItemWidget extends StatelessWidget {
  final Color dotColor;
  final String name;
  const AllocationLegendListItemWidget({
    super.key,
    required this.dotColor,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
          ),
          SizedBox(
            width: 10,
          ),
          Text(name,
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 12))
        ],
      ),
    );
  }
}
