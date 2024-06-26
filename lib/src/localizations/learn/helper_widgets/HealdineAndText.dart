import 'package:everyday_invest/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlineAndText extends StatelessWidget {
  const HeadlineAndText({super.key, required this.heading, required this.text});

  final String heading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SizedBox(
              width: double.infinity,
              child: Text(heading,
                  style: GoogleFonts.nunito(
                      color: mAccentColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
            ),
          ),
          Text(text,
              style: GoogleFonts.nunito(
                  color: mAccentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12))
        ],
      ),
    );
  }
}
