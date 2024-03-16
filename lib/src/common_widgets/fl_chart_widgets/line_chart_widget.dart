import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/utils/fl_charts/price_points.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key, required this.points});
  final List<PricePoint> points;
  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 2018:
              text = '\'18';
              break;
            case 2019:
              text = '\'19';
              break;
            case 2020:
              text = '\'20';
              break;
            case 2021:
              text = '\'21';
              break;
            case 2022:
              text = '\'22';
              break;
            case 2023:
              text = '\'23';
              break;
          }

          return Text(text,
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold, fontSize: 14));
        },
      );
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(
        lineBarsData: [
          LineChartBarData(
              spots:
                  points.map((points) => FlSpot(points.x, points.y)).toList(),
              isCurved: true,
              dotData: FlDotData(show: true),
              color: mDarkBlue)
        ],
        borderData: FlBorderData(
            border: const Border(bottom: BorderSide(), left: BorderSide())),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      )),
    );
  }
}
