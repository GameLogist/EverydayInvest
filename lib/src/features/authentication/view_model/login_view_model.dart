import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  static LoginViewModel get instance => Get.find();

  // TextField Controllers to get data from TextFields.
  final email = TextEditingController();
  final password = TextEditingController();

  // Call this funtion from Design to login user
  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
