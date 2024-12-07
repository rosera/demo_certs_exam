
// Domain
// Domain for Certifications
// -----------------------------------------------------------------------------

// class ItemText {
//   final String title;
//   // final List<String> topics;
//
//   ItemText({
//     required this.title,
//     // required this.topics,
//   });
//
//   // // Use a Factory to enable processing to be perform + return value
//   // factory DomainItem.fromJson(Map<String, dynamic> json) {
//   //   return DomainItem(
//   //     percent: json['percent'],
//   //     // topics: json['topic'],
//   //   );
//   // }
// }

class DomainItem {
  final String percent;
  final String heading;
  final List<String> topics;

  DomainItem({
    required this.percent,
    required this.heading,
    required this.topics,
  });

  // Use a Factory to enable processing to be perform + return value
  factory DomainItem.fromJson(Map<String, dynamic> json) {
    return DomainItem(
      percent: json['percentage'],
      heading: json['heading'],
      // topics: json['topic'],
      topics: List<String>.from(json['topics']),
    );
  }
}

class Domains{
  final List<DomainItem> domainItems;

  // Constructor
  Domains({
    required this.domainItems,
  });

  // Use a Factory to enable processing to be perform + return value
  factory Domains.fromJson(Map<String, dynamic> json) {
    // Use the json list name as reference
    var list = json['domains'] as List;

    List<DomainItem> domains = list
        .map((domainItems) => DomainItem.fromJson(domainItems))
        .toList();

    return Domains( domainItems: domains);
  }
}
