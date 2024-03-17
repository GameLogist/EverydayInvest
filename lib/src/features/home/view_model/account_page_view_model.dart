import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everyday_invest/src/features/authentication/model/user_model.dart';
import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:everyday_invest/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPageViewModel extends GetxController {
  static AccountPageViewModel get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // TextField Controllers to get data from TextFields.
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  getUserDetails() {
    final email = _authRepo.firebaseUser.value?.email;

    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  setUserData(UserModel userData) {
    fullNameController.text = userData.fullName;
    emailController.text = userData.email;
    phoneNoController.text = userData.phoneNo;
    passwordController.text = userData.password;
  }

  updateUserRecord(UserModel user) async {
    await _userRepo.editProfile(user);
  }
}
