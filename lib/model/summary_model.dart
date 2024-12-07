
// Summary
// Summary for Certifications
// -----------------------------------------------------------------------------

class OverviewItem {
  final String tag;
  final String title;
  final String description;

  OverviewItem({
    required this.tag,
    required this.title,
    required this.description,
  });

  // Use a Factory to enable processing to be perform + return value
  factory OverviewItem.fromJson(Map<String, dynamic> json) {
    return OverviewItem(
      tag: json['tag'],
      title: json['title'],
      description: json['description'],
    );
  }
}

class Overviews{
  final List<OverviewItem> overviewItems;

  // Constructor
  Overviews({
    required this.overviewItems,
  });

  // Use a Factory to enable processing to be perform + return value
  factory Overviews.fromJson(Map<String, dynamic> json) {
    // Use the json list name as reference
    var list = json['summary'] as List;

    List<OverviewItem> plans = list
        .map((planItems) => OverviewItem.fromJson(planItems))
        .toList();

    return Overviews( overviewItems: plans);
  }
}
