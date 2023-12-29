import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/authentication/view_model/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingViewModel = OnboardingViewModel();
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          pages: onboardingViewModel.pages,
          enableSideReveal: true,
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          liquidController: onboardingViewModel.liquidController,
          onPageChangeCallback: onboardingViewModel.onPageChangeCallback,
        ),
        Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => onboardingViewModel.animateToNextPage(),
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  foregroundColor: Colors.white),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: mPrimarydark, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            )),
        Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => onboardingViewModel.skip(),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            )),
        Obx(
          () => Positioned(
              bottom: 20,
              child: AnimatedSmoothIndicator(
                activeIndex: onboardingViewModel.currentPage.value,
                count: 3,
                effect: const WormEffect(
                    activeDotColor: Colors.black87, dotHeight: 5.0),
              )),
        )
      ],
    ));
  }
}
