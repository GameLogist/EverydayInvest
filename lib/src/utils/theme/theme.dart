import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:everyday_invest/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:everyday_invest/src/utils/theme/widget_themes/text_theme.dart';
import 'package:everyday_invest/src/utils/theme/widget_themes/textfield_theme.dart';
import 'package:flutter/material.dart';

class InvestTheme {
  InvestTheme._();

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: mPrimaryWhite,
      brightness: Brightness.light,
      textTheme: InvTextTheme.lightTextTheme,
      outlinedButtonTheme: InvOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: InvElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: InvTextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: mPrimarydark,
      brightness: Brightness.dark,
      textTheme: InvTextTheme.darkTextTheme,
      outlinedButtonTheme: InvOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: InvElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: InvTextFormFieldTheme.darkInputDecorationTheme);
}
