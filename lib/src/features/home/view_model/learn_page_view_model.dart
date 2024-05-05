import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everyday_invest/src/features/authentication/model/user_model.dart';
import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:everyday_invest/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnPageViewModel extends GetxController {
  static LearnPageViewModel get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final userName = "".obs;
  late Rx<UserModel> userData =
      const UserModel(fullName: "", email: "", phoneNo: "", password: "").obs;
  final _userRepo = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    getUserDetails();
  }

  getUserDetails() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      _userRepo.getUserDetails(email).then((data) {
        print("userdata - ${data.fullName}");
        userData.value = data;
      });
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
