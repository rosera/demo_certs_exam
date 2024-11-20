// Topic
// Topics for Google Cloud Certifications
// -----------------------------------------------------------------------------

class TopicItem {
  final String tagId;
  final String ref;
  final String heading;
  final String title;
  final String subtitle;
  final String description;

  // Constructor
  TopicItem({
    required this.tagId,
    required this.ref,
    required this.heading,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  // Use a Factory to enable processing to be perform + return value
  factory TopicItem.fromJson(Map<String, dynamic> json) {
    return TopicItem(
      tagId: json['tagId'],
      ref: json['ref'],
      heading: json['heading'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
    );
  }
}

// Certification
// Information on the Google Cloud Certifications
class Topics{
  final List<TopicItem> topicItem;

  // Constructor
  Topics({required this.topicItem});

  // Use a Factory to enable processing to be perform + return value
  factory Topics.fromJson(Map<String, dynamic> json) {
    // Use the json list name as reference
    var list = json['topics'] as List;

    List<TopicItem> products = list
        .map((productItems) => TopicItem.fromJson(productItems))
        .toList();

    return Topics(topicItem: products);
  }
}