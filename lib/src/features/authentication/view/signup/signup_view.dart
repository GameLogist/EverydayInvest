import 'package:everyday_invest/src/common_widgets/form/form_header_widget.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/view/signup/signup_form_footer.dart';
import 'package:everyday_invest/src/features/authentication/view/signup/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(mDefaultSizes),
            child: Column(
              children: [
                FormHeaderWidget(
                    image: mWelcomeImage,
                    title: mSignUpTitle,
                    subtitle: mSignUpSubTitle),
                SignUpFormWidget(),
                SignUpFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
