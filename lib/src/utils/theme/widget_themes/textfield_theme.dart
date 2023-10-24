import 'package:everyday_invest/src/constants/colors.dart';
import 'package:flutter/material.dart';

class InvTextFormFieldTheme {
  InvTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: mPrimarydark,
          floatingLabelStyle: TextStyle(color: mPrimarydark),
          labelStyle: TextStyle(color: mPrimarydark),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: mPrimarydark)));

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: mPrimaryColor,
          floatingLabelStyle: TextStyle(color: mPrimaryColor),
          labelStyle: TextStyle(color: mPrimaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: mPrimaryColor)));
}
