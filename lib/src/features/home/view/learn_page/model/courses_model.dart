class CourseModel {
  final int courseId;
  final String title;
  final String moduleNumber;
  final eCourseDifficulty difficulty;
  final int totalChaptors;
  final List<ChaptorModel> chaptors;
  int currentChaptorProgress;

  CourseModel({
    required this.courseId,
    required this.title,
    required this.moduleNumber,
    required this.difficulty,
    required this.totalChaptors,
    required this.chaptors,
    this.currentChaptorProgress = 0,
  });
}

// ignore: camel_case_types
enum eCourseDifficulty {
  beginner("Beginner"),
  intermediate("Intermediate"),
  advanced("Advanced");

  const eCourseDifficulty(this.text);
  final String text;
}

class ChaptorModel {
  final int chaptorId;
  final int courseId;
  final String title;
  final int totalChaptors;
  final int totalTime;

  ChaptorModel(
      {required this.chaptorId,
      required this.courseId,
      required this.title,
      required this.totalChaptors,
      required this.totalTime});
}
