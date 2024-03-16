import 'package:everyday_invest/src/constants/sizes.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/model/user_model.dart';
import 'package:everyday_invest/src/features/authentication/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Get.put(SignupViewModel());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: mFormHeight - 10),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: signUpViewModel.fullName,
                decoration: const InputDecoration(
                    label: Text(mFullName),
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                    )),
              ),
              const SizedBox(height: mInterFormFieldDistance - 10),
              TextFormField(
                controller: signUpViewModel.email,
                decoration: const InputDecoration(
                    label: Text(mEmail),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    )),
              ),
              const SizedBox(height: mInterFormFieldDistance - 10),
              TextFormField(
                controller: signUpViewModel.phoneNo,
                decoration: const InputDecoration(
                    label: Text(mPhoneNumber),
                    prefixIcon: Icon(
                      Icons.numbers,
                    )),
              ),
              const SizedBox(height: mInterFormFieldDistance - 10),
              TextFormField(
                controller: signUpViewModel.password,
                decoration: const InputDecoration(
                    label: Text(mPassword),
                    prefixIcon: Icon(
                      Icons.fingerprint,
                    )),
              ),
              const SizedBox(height: mInterFormFieldDistance),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final user = UserModel(
                            fullName: signUpViewModel.fullName.text.trim(),
                            email: signUpViewModel.email.text.trim(),
                            phoneNo: signUpViewModel.phoneNo.text.trim(),
                            password: signUpViewModel.password.text.trim());
                        SignupViewModel.instance.createUser(user);
                      }
                    },
                    child: const Text(mSignup)),
              )
            ],
          )),
    );
  }
}
