import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPageViewModel extends GetxController {
  static AccountPageViewModel get instance => Get.find();

  // TextField Controllers to get data from TextFields.
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  // Call this funtion from Design to edit user details
  void editProfile(String email, String password) {}
}
