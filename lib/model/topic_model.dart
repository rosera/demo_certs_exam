
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
  final List<TopicItem> topicItems;

  // Constructor
  Topics({
    required this.topicItems,
  });

  // Use a Factory to enable processing to be perform + return value
  factory Topics.fromJson(Map<String, dynamic> json) {
    // Use the json list name as reference
    var list = json['topics'] as List;

    List<TopicItem> topics = list
        .map((topicItems) => TopicItem.fromJson(topicItems))
        .toList();

    return Topics( topicItems: topics);
  }
}