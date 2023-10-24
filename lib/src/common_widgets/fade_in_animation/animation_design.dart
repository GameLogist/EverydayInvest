import 'package:everyday_invest/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation(
      {super.key,
      required this.durationInMS,
      this.animate,
      required this.child});

  final controller = Get.put(FadeInAnimationController());
  final int durationInMS;
  final AnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
          duration: Duration(milliseconds: durationInMS),
          top:
              controller.animate.value ? animate!.topAfter : animate!.topBefore,
          bottom: controller.animate.value
              ? animate!.bottomAfter
              : animate!.bottomBefore,
          left: controller.animate.value
              ? animate!.leftAfter
              : animate!.leftBefore,
          right: controller.animate.value
              ? animate!.rightAfter
              : animate!.rightBefore,
          child: AnimatedOpacity(
              duration: Duration(milliseconds: durationInMS),
              opacity: controller.animate.value ? 1 : 0,
              child: child)),
    );
  }
}
