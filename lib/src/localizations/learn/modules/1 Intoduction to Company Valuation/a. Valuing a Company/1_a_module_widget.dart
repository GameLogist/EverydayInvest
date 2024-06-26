import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/localizations/learn/helper_widgets/HealdineAndText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class ModuleWidget_1A extends StatelessWidget {
  const ModuleWidget_1A({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HeadlineAndText(
              heading: "What Is a Business Valuation?",
              text:
                  "A business valuation, also known as a company valuation, is the process of determining the economic value of a business. During the valuation process, all areas of a business are analyzed to determine its worth and the worth of its departments or units. "),
          Text("Courses",
              style: GoogleFonts.nunito(
                  color: mAccentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18))
        ],
      ),
    );
  }
}
