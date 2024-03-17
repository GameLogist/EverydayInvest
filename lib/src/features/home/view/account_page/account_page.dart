import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/authentication/model/user_model.dart';
import 'package:everyday_invest/src/features/home/view/account_page/update_account_page.dart';
import 'package:everyday_invest/src/features/home/view_model/account_page_view_model.dart';
import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:everyday_invest/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final AccountPageViewModel viewModel = Get.put(AccountPageViewModel());

    return SizedBox.expand(
      child: Container(
        color: mPrimaryBackground,
        child: SingleChildScrollView(
          child: Center(
              child: FutureBuilder(
            future: viewModel.getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  viewModel.setUserData(userData);
                  return Column(
                    children: [
                      SizedBox(
                        height: 128,
                      ),

                      // Profile Picture
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                    image: AssetImage(mDefaultProfileImage))),
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
                                  LineAwesomeIcons.alternate_pencil,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ))
                        ],
                      ),

                      // Text Below Image
                      SizedBox(
                        height: 12,
                      ),
                      Text(userData.fullName,
                          style: GoogleFonts.nunito(
                              color: mDarkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Text(userData.email,
                          style: GoogleFonts.nunito(
                              color: mDarkBlue,
                              fontWeight: FontWeight.normal,
                              fontSize: 16)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => UpdateProfileView());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mDarkBlue,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: Text(mEditProfile,
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)))),
                      SizedBox(
                        height: 20,
                      ),

                      // Menu
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Column(
                          children: [
                            ProfileMenuListTile(
                              text: mMenuItem1,
                              icon: LineAwesomeIcons.cog,
                              onPress: () {
                                viewModel.getUserDetails();
                              },
                            ),
                            ProfileMenuListTile(
                              text: mMenuItem2,
                              icon: LineAwesomeIcons.scroll,
                              onPress: () {},
                            ),
                            ProfileMenuListTile(
                              text: mMenuItem3,
                              icon: LineAwesomeIcons.bell,
                              onPress: () {},
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProfileMenuListTile(
                              text: mMenuItem4,
                              icon: LineAwesomeIcons.landmark,
                              onPress: () {},
                            ),
                            ProfileMenuListTile(
                              text: mLogout,
                              icon: LineAwesomeIcons.poo,
                              textColor: Colors.red,
                              endIcon: false,
                              onPress: () {
                                AuthenticationRepository.instance.logout();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
        ),
      ),
    );
  }
}

class ProfileMenuListTile extends StatelessWidget {
  const ProfileMenuListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: mLavender),
        child: Icon(icon, color: mDarkBlue),
      ),
      title: Text(text,
          style: GoogleFonts.nunito(
              color: textColor, fontWeight: FontWeight.normal, fontSize: 16)),
      trailing: endIcon
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: const Icon(LineAwesomeIcons.angle_right, color: mDarkBlue),
            )
          : null,
    );
  }
}
