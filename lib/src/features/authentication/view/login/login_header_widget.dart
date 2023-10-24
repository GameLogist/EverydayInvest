import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(mWelcomeImage), height: size.height * 0.2),
        Text(mLoginTitle, style: Theme.of(context).textTheme.headlineMedium),
        Text(
          mLoginSubtitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
