import 'package:everyday_invest/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        color: mPrimaryWhite,
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          child: Text(
            "Coming Soon!",
            style: GoogleFonts.nunito(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ));
  }
}
