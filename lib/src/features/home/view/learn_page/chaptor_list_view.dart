import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/chaptor_list_item_card_view.dart';
import 'package:everyday_invest/src/features/home/view/learn_page/model/courses_model.dart';
import 'package:everyday_invest/src/features/home/view_model/learn_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterListView extends StatelessWidget {
  ChapterListView({super.key, required this.courseData});

  final CourseModel courseData;
  final LearnPageViewModel learnPageViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mPrimaryWhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: courseData.totalChaptors,
              itemBuilder: (BuildContext context, int index) {
                return ChaptorListItemCardView(
                  chaptorData: courseData.chaptors[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
