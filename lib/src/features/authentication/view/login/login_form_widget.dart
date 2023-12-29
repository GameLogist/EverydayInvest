import 'package:everyday_invest/main.dart';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/home/view/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: mInterFormFieldDistance),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: mEmail,
                hintText: mEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: mInterFormFieldDistance),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: mPassword,
                hintText: mPassword,
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: mInterFormFieldDistance - 10),
          Align(
              alignment: Alignment.centerRight,
              child:
                  TextButton(onPressed: () {}, child: Text(mForgetPassword))),
          const SizedBox(height: mInterFormFieldDistance - 10),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigationPage()),
                  child: Text(mLogin)))
        ],
      ),
    ));
  }
}
