import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/model/onboarding_model.dart';
import 'package:everyday_invest/src/features/authentication/view/onboarding/onboarding_page_view.dart';
import 'package:everyday_invest/src/features/authentication/view/welcome/welcome_view.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingViewModel extends GetxController {
  final liquidController = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnboardingPageView(
        model: OnBoardingModel(
            image: mOnboardingImage1,
            title: mOnboardingTitle1,
            subTitle: mOnboardingSubTitle1,
            counter: mOnboardingCounter1,
            bgColor: mOnboardingPage1Color)),
    OnboardingPageView(
        model: OnBoardingModel(
            image: mOnboardingImage2,
            title: mOnboardingTitle2,
            subTitle: mOnboardingSubTitle2,
            counter: mOnboardingCounter2,
            bgColor: mOnboardingPage2Color)),
    OnboardingPageView(
        model: OnBoardingModel(
            image: mOnboardingImage3,
            title: mOnboardingTitle3,
            subTitle: mOnboardingSubTitle3,
            counter: mOnboardingCounter3,
            bgColor: mOnboardingPage3Color))
  ];

  void onPageChangeCallback(int activePageIndex) {
    if (currentPage.value == 2 && activePageIndex == 0) {
      Get.to(() => const WelcomeView());
    } else {
      currentPage.value = activePageIndex;
    }
  }

  skip() => Get.to(() => const WelcomeView());

  animateToNextPage() {
    int nextPage = liquidController.currentPage + 1;
    if (currentPage.value == 2) {
      Get.to(() => const WelcomeView());
    } else {
      liquidController.animateToPage(page: nextPage);
    }
  }
}
