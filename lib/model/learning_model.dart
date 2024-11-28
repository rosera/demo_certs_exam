
// Learning Path
// Path for Certifications
// -----------------------------------------------------------------------------

class LearningItem {
  final String tag;
  final String title;
  final String description;

  LearningItem({
    required this.tag,
    required this.title,
    required this.description,
  });

  // Use a Factory to enable processing to be perform + return value
  factory LearningItem.fromJson(Map<String, dynamic> json) {
    return LearningItem(
      tag: json['tag'],
      title: json['title'],
      description: json['description'],
    );
  }
}

class Learnings{
  final List<LearningItem> learningItems;

  // Constructor
  Learnings({
    required this.learningItems,
  });

  // Use a Factory to enable processing to be perform + return value
  factory Learnings.fromJson(Map<String, dynamic> json) {
    // Use the json list name as reference
    var list = json['learning'] as List;

    List<LearningItem> learnings = list
        .map((learningItems) => LearningItem.fromJson(learningItems))
        .toList();

    return Learnings( learningItems: learnings);
  }
}