import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/model/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesGridTile extends StatelessWidget {
  const CoursesGridTile({
    super.key,
    required this.courseData,
  });

  final CourseModel courseData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: new BoxDecoration(
          color: pastelColorArray[1],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
                color: Colors.black38, blurRadius: 6.0, offset: Offset(0, 1.5)),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
              color: mLavender,
            ),
            Text(courseData.title,
                style: GoogleFonts.nunito(
                    color: mDarkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
                maxLines: 2)
          ],
        ),
      ),
    );
  }
}
