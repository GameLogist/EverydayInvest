import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mPrimaryWhite,
      child: Center(
        child: Text(
          "Investments",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
