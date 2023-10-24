import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class InvOutlinedButtonTheme {
  InvOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: mAccentColor,
        side: BorderSide(color: mAccentColor),
        padding: EdgeInsets.symmetric(vertical: mButtonHeight)),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: mTertiaryColor,
        side: BorderSide(color: mTertiaryColor),
        padding: EdgeInsets.symmetric(vertical: mButtonHeight)),
  );
}
