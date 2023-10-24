import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/features/authentication/view/login/login_footer_widget.dart';
import 'package:everyday_invest/src/features/authentication/view/login/login_form_widget.dart';
import 'package:everyday_invest/src/features/authentication/view/login/login_header_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(mDefaultSizes),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeaderWidget(),
              const LoginForm(),
              const LoginFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
