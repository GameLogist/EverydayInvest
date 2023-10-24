import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(mOr),
        const SizedBox(height: mInterFormFieldDistance),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: Image(
                image: AssetImage(mGoogleIcon),
                width: 20.0,
              ),
              onPressed: () {},
              label: const Text(mSignInWithGoogle)),
        ),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: mDontHaveAnAccount,
                style: Theme.of(context).textTheme.titleMedium,
                children: const [
                  TextSpan(text: mSignup, style: TextStyle(color: Colors.blue))
                ])))
      ],
    );
  }
}
