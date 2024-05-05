import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/home/view_model/learn_page_view_model.dart';
import 'package:everyday_invest/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final LearnPageViewModel learnPageViewModel = Get.put(LearnPageViewModel());

    return Container(
      color: mPrimaryWhite,
      child: Container(
        width: size.width,
        color: mBeigePink,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Obx(() => Text(
                    "Hey, ${learnPageViewModel.userData.value.fullName.split(' ')[0]}!",
                    style: GoogleFonts.nunito(
                        color: mDarkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 24))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: size.width,
                  height: size.height / 5,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: mAccentColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(mLearnPageHeadImage),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text("Zenfolio Video Series!",
                                style: GoogleFonts.nunito(
                                    color: mDarkBlue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16)),
                            Text(
                                "Introducing Zenfolio's recommendations of helpful investment guides! Lets get you on track!",
                                style: GoogleFonts.nunito(
                                    color: mDarkBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12)),
                            Text("Explore",
                                style: GoogleFonts.nunito(
                                    color: mLavender,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16))
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
