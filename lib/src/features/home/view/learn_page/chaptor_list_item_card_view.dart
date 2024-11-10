import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/model/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChaptorListItemCardView extends StatelessWidget {
  const ChaptorListItemCardView({
    super.key, required this.chaptorData,
  });

  final ChaptorModel chaptorData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: new BoxDecoration(
          color: mPrimaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
                color: Colors.black38, blurRadius: 6.0, offset: Offset(0, 1.5)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Text("Chaptor:",
                  style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14)),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text("${chaptorData.chaptorId}",
                    style: GoogleFonts.kaushanScript(
                        color: mDarkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 18)),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.align_vertical_bottom_rounded),
                SizedBox(
                  width: 8,
                ),
                Text(chaptorData.title,
                    style: GoogleFonts.nunito(
                        color: mDarkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 16))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("Time:",
                          style: GoogleFonts.nunito(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                      SizedBox(
                        width: 12,
                      ),
                      Text("${chaptorData.totalTime}",
                          style: GoogleFonts.nunito(
                              color: mDarkBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 16))
                    ],
                  ),
                ),
                // Container(
                //   alignment: Alignment.topRight,
                //   child: Row(
                //     children: [
                //       Text("Chaptor : ",
                //           style: GoogleFonts.nunito(
                //               color: Colors.grey,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12)),
                //       Text("${chaptorData.currentChaptorProgress}",
                //           style: GoogleFonts.nunito(
                //               color: mDarkBlue,
                //               fontWeight: FontWeight.w700,
                //               fontSize: 16)),
                //       SizedBox(
                //         width: 12,
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            // LinearProgressIndicator(
            //   value: chaptorData.currentChaptorProgress / chaptorData.totalChaptors,
            //   backgroundColor: Colors.black12,
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            //   borderRadius: BorderRadius.circular(100),
            // ),
          ]),
        ),
      ),
    );
  }
}
