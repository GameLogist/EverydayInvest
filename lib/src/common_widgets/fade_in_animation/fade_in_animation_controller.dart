import 'package:everyday_invest/src/features/authentication/view/onboarding/onboarding_view.dart';
import 'package:everyday_invest/src/features/authentication/view/welcome/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAll(() => WelcomeView());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
