import 'package:everyday_invest/src/features/authentication/model/user_model.dart';
import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:everyday_invest/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  static SignupViewModel get instance => Get.find();

  // TextField Controllers to get data from TextFields.
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  // Call this funtion from Design to register user
  Future<void> registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    } else {
      print("Your User is logged in successfuly!");
    }
  }

  Future<void> createUser(UserModel user) async {
    registerUser(user.email, user.password)
        .whenComplete(() async => await userRepo.createUser(user));
  }
}
