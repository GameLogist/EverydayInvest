import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: mPrimaryWhite,
      child: Container(
        width: size.width,
        color: mBeigePink,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text("Top Courses",
                    style: GoogleFonts.nunito(
                        color: mDarkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 24)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
