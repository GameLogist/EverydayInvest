import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineSmall: GoogleFonts.nunito(color: Colors.black54),
    headlineMedium: GoogleFonts.nunito(
        color: Colors.black, fontWeight: FontWeight.w700, fontSize: 28),
    headlineLarge: GoogleFonts.nunito(color: Colors.black87),
    titleLarge: GoogleFonts.nunito(color: Colors.black),
    titleMedium: GoogleFonts.nunito(color: Colors.black),
    titleSmall: GoogleFonts.nunito(color: Colors.black),
    labelLarge:
        GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.nunito(color: Colors.black),
    labelSmall: GoogleFonts.nunito(color: Colors.black),
  );
  static TextTheme darkTextTheme = TextTheme(
      headlineSmall: GoogleFonts.nunito(color: Colors.white70),
      headlineMedium: GoogleFonts.nunito(
          color: Colors.white70, fontWeight: FontWeight.w700, fontSize: 28),
      headlineLarge: GoogleFonts.nunito(color: Colors.white70),
      titleLarge: GoogleFonts.nunito(color: Colors.white70),
      titleMedium: GoogleFonts.nunito(color: Colors.white70),
      titleSmall: GoogleFonts.nunito(color: Colors.white70),
      labelLarge: GoogleFonts.nunito(
          color: Colors.white70, fontWeight: FontWeight.bold),
      labelMedium: GoogleFonts.nunito(color: Colors.white70),
      labelSmall: GoogleFonts.nunito(color: Colors.white70));
}
