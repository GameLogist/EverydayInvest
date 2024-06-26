import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/constants/image_strings.dart';
import 'package:everyday_invest/src/constants/text_string.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/courses_grid_tile.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/module_journey_card.dart';
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
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: mOnboardingPage1Color,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),

              // Greeting
              Padding(
                padding: const EdgeInsets.all(16.0),
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

              // Video Series
              Padding(
                padding: const EdgeInsets.all(14.0),
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Zenfolio Video Series!",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.nunito(
                                        color: mDarkBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                    "Introducing Zenfolio's recommendations of helpful investment guides! Lets get you on track!",
                                    style: GoogleFonts.nunito(
                                        color: mDarkBlue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                    maxLines: 4),
                                SizedBox(
                                  height: 12,
                                ),
                                Text("Explore",
                                    style: GoogleFonts.nunito(
                                        color: mLavender,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16))
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),

              // Journey header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text("Lets start a journey!",
                      style: GoogleFonts.nunito(
                          color: mAccentColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ),
              ),

              ModuleJourneyCard(courseData: learnPageViewModel.modulesToStartOrContinue[0],),

              // Courses Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text("Courses",
                      style: GoogleFonts.nunito(
                          color: mAccentColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Expanded(
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0,
                            crossAxisCount: 2,
                            childAspectRatio: 1),
                    children: learnPageViewModel.allModules.map((course) {
                      return CoursesGridTile(courseData: course);
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
