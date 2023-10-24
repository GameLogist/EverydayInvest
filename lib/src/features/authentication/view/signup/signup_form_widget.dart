import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: mFormHeight - 10),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                label: Text(mFullName),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                )),
          ),
          const SizedBox(height: mInterFormFieldDistance - 10),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(mEmail),
                prefixIcon: Icon(
                  Icons.email_outlined,
                )),
          ),
          const SizedBox(height: mInterFormFieldDistance - 10),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(mPhoneNumber),
                prefixIcon: Icon(
                  Icons.numbers,
                )),
          ),
          const SizedBox(height: mInterFormFieldDistance - 10),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(mPassword),
                prefixIcon: Icon(
                  Icons.fingerprint,
                )),
          ),
          const SizedBox(height: mInterFormFieldDistance),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: const Text(mSignup)),
          )
        ],
      )),
    );
  }
}
