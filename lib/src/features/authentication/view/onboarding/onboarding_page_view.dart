import 'dart:ui';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/features/authentication/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(mDefaultSizes),
      color: model.bgColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage(model.image),
              height: size.height * 0.40,
            ),
            Column(
              children: [
                Text(
                  model.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  model.subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Text(
              model.counter,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: 50.0,
            )
          ]),
    );
  }
}
