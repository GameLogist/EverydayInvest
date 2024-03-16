import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/home/view_model/account_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final accountPageViewModel = Get.put(AccountPageViewModel());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mLavender,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(mEditProfile,
            style: GoogleFonts.nunito(
                color: mDarkBlue, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Container(
        height: double.infinity,
        color: mLavender,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:
                              Image(image: AssetImage(mDefaultProfileImage))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: mDarkBlue),
                          child: const Icon(
                            LineAwesomeIcons.camera,
                            color: Colors.white,
                            size: 20,
                          ),
                        ))
                  ],
                ),

                SizedBox(
                  height: 36,
                ),

                // Form
                Form(
                  key: formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: accountPageViewModel.fullName,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_rounded),
                          labelText: mFullName,
                          hintText: mFullName,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: accountPageViewModel.email,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: mEmail,
                          hintText: mEmail,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: accountPageViewModel.phoneNo,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: mPhoneNumber,
                          hintText: mPhoneNumber,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: accountPageViewModel.password,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.fingerprint),
                          labelText: mPassword,
                          hintText: mPassword,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () => {Get.back()},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mDarkBlue,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: Text(mEditProfile,
                              style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16))),
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
