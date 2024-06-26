class CourseModel {
  final int courseId;
  final String title;
  final String moduleNumber;
  final eCourseDifficulty difficulty;
  final int totalChaptors;
  int currentChaptorProgress;

  CourseModel({
    required this.courseId,
    required this.title,
    required this.moduleNumber,
    required this.difficulty,
    required this.totalChaptors,
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
