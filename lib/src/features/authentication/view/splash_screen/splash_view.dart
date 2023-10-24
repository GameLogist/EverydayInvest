import 'package:everyday_invest/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:everyday_invest/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: 340,
              left: 100,
              child: Image(image: AssetImage(mSplashImage))),
          FadeInAnimation(
            durationInMS: 1600,
            animate: AnimatePosition(
                bottomBefore: 230,
                bottomAfter: 280,
                leftBefore: 0,
                leftAfter: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  mAppName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  mAppTagLine,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
