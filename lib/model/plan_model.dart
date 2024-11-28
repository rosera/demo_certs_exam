
// Plan
// Plan for Certifications
// -----------------------------------------------------------------------------

class PlanItem {
  final String tag;
  final String title;
  final String topic;
  final String description;

  PlanItem({
    required this.tag,
    required this.title,
    required this.topic,
    required this.description,
  });

  // Use a Factory to enable processing to be perform + return value
  factory PlanItem.fromJson(Map<String, dynamic> json) {
    return PlanItem(
      tag: json['tag'],
      title: json['title'],
      topic: json['topic'],
      description: json['description'],
    );
  }
}

class Plans{
  final List<PlanItem> planItems;

  // Constructor
  Plans({
    required this.planItems,
  });

  // Use a Factory to enable processing to be perform + return value
  factory Plans.fromJson(Map<String, dynamic> json) {
    // Use the json list name as reference
    var list = json['plan'] as List;

    List<PlanItem> plans = list
        .map((planItems) => PlanItem.fromJson(planItems))
        .toList();

    return Plans( planItems: plans);
  }
}
