import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/view/login/login_view.dart';
import 'package:everyday_invest/src/features/authentication/view/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(mDefaultSizes),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage(mWelcomeImage),
            height: height * 0.5,
          ),
          Column(
            children: [
              Text(mWelcomeTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(mWelcomeSubTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const LoginView()),
                      child: Text(mLogin.toUpperCase()))),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignUpView()),
                    child: Text(mSignup.toUpperCase())),
              )
            ],
          )
        ]),
      ),
    );
  }
}
