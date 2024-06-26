class ModuleJourneyCardModel {
  final String courseId;
  final String title;
  final String moduleNumber;
  final String difficulty;
  final String totalChaptors;
  final String currentChaptorProgress;

  ModuleJourneyCardModel({
    required this.courseId,
    required this.title,
    required this.moduleNumber,
    required this.difficulty,
    required this.totalChaptors,
    required this.currentChaptorProgress,
  });
}
