import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class InvElevatedButtonTheme {
  InvElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: mAccentColor,
        side: BorderSide(color: mAccentColor),
        padding: EdgeInsets.symmetric(vertical: mButtonHeight)),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: mAccentColor,
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.white),
        padding: EdgeInsets.symmetric(vertical: mButtonHeight)),
  );
}
