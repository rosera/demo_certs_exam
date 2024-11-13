
// Certification
// Information on the Google Cloud Certifications
// -----------------------------------------------------------------------------

class CertificationItem {
  final String tag;
  final String level;
  final String header;
  final String title;
  final String description;
  final String url;
  final String image;
  final String questions;
  final int cost;
  final int duration;
  final int experience;

  // Constructor
  CertificationItem({
    required this.tag,
    required this.level,
    required this.header,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.questions,
    required this.cost,
    required this.duration,
    required this.experience,
  });

  // Use a Factory to enable processing to be perform + return value
  factory CertificationItem.fromJson(Map<String, dynamic> json) {
    return CertificationItem(
      tag: json['tag'],
      level: json['level'],
      header: json['header'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      image: json['image'],
      questions: json['questions'],
      cost: json['cost'],
      duration: json['duration'],
      experience: json['experience'],
    );
  }
}

// Certification
// Information on the Google Cloud Certifications
class Certifications {
  final List<CertificationItem> certificationItem;

  // Constructor
  Certifications({required this.certificationItem});

  // Use a Factory to enable processing to be perform + return value
  factory Certifications.fromJson(Map<String, dynamic> json) {
    var list = json['gcp'] as List;

    List<CertificationItem> products = list
        .map((productItems) => CertificationItem.fromJson(productItems))
        .toList();

    return Certifications(certificationItem: products);
  }
}
// Certifications
// -----------------------------------------------------------------------------
List<CertificationItem> professional = [];
List<CertificationItem> associate = [];
List<CertificationItem> foundational = [];
List<CertificationItem> fellow = [];