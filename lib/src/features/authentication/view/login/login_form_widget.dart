import 'package:everyday_invest/main.dart';
import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/view_model/login_view_model.dart';
import 'package:everyday_invest/src/features/home/view/navigation_page.dart';
import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:everyday_invest/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: mInterFormFieldDistance),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: loginViewModel.email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: mEmail,
                    hintText: mEmail,
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: mInterFormFieldDistance),
              TextFormField(
                controller: loginViewModel.password,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    labelText: mPassword,
                    hintText: mPassword,
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: mInterFormFieldDistance - 10),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: Text(mForgetPassword))),
              const SizedBox(height: mInterFormFieldDistance - 10),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginViewModel.instance.loginUser(
                              loginViewModel.email.text.trim(),
                              loginViewModel.password.text.trim());
                        }
                      },
                      child: Text(mLogin)))
            ],
          ),
        ));
  }
}
