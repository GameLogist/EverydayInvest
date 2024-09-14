import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/model/investments_page_models.dart';
import 'package:get/get.dart';

enum InvestmentAllocationList {
  indianStock("IND Stocks"),
  usStocks("US Stocks"),
  mutualFunds("Mutual Funds"),
  bonds("Bonds"),
  fixedDeposite("Fixed Deposits");

  const InvestmentAllocationList(this.text);
  final String text;
}

class InvestmentsPageViewModel extends GetxController {
  List<PieChartSector> get pieChartSectors {
    return [
      PieChartSector(color: pastelColorArray[0], value: 20),
      PieChartSector(color: pastelColorArray[1], value: 30),
      PieChartSector(color: pastelColorArray[2], value: 10),
      PieChartSector(color: pastelColorArray[3], value: 5),
      PieChartSector(color: pastelColorArray[4], value: 35),
    ];
  }
}
