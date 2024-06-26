import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everyday_invest/src/features/authentication/model/user_model.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/model/courses_model.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/model/module_journey_card_model.dart';
import 'package:everyday_invest/src/localizations/learn/modules/1%20Intoduction%20to%20Company%20Valuation/a.%20Valuing%20a%20Company/1_a_module_widget.dart';
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

  // Module Journey
  List<CourseModel> modulesToStartOrContinue = [];
  List<CourseModel> allModules = [];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    getUserDetails();
    loadModuleData();
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

  void loadModuleData() {
    allModules = [
      CourseModel(
          courseId: 1,
          title: "Introduction To Company Valuation",
          moduleNumber: "1",
          difficulty: eCourseDifficulty.beginner,
          totalChaptors: 3),
      CourseModel(
          courseId: 2,
          title: "Financial Statements",
          moduleNumber: "2",
          difficulty: eCourseDifficulty.intermediate,
          totalChaptors: 3),
      CourseModel(
          courseId: 3,
          title: "Financial Ratios",
          moduleNumber: "3",
          difficulty: eCourseDifficulty.intermediate,
          totalChaptors: 6),
      CourseModel(
          courseId: 4,
          title: "Fundamental Analysis Basics",
          moduleNumber: "4",
          difficulty: eCourseDifficulty.intermediate,
          totalChaptors: 11),
      CourseModel(
          courseId: 5,
          title: "Fundamental Analysis Tools and Methods",
          moduleNumber: "5",
          difficulty: eCourseDifficulty.intermediate,
          totalChaptors: 12),
      CourseModel(
          courseId: 6,
          title: "Valuing Non-Public Companies",
          moduleNumber: "6",
          difficulty: eCourseDifficulty.advanced,
          totalChaptors: 2)
    ];

    modulesToStartOrContinue = [allModules[0]];
  }
}
