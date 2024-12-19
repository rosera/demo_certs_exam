import 'package:demo_cert_exam/model/summary_model.dart';

import '/model/topic_model.dart';
import '/model/plan_model.dart';
import '/model/domain_model.dart';
import 'learning_model.dart';

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
  final List<TopicItem?>topics;
  final List<OverviewItem?>overviews;
  final List<PlanItem?>plans;
  final List<LearningItem?>learnings;
  final List<DomainItem?>domains;

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
    required this.topics,
    required this.overviews,
    required this.plans,
    required this.learnings,
    required this.domains,
  });

  // Use a Factory to enable processing to be perform + return value
  factory CertificationItem.fromJson(Map<String, dynamic> json) {
    var listTopics    = json['topics'] as List;
    var listOverviews = json['summary'] as List;
    var listPlans     = json['plan'] as List;
    var listLearnings = json['learning'] as List;
    var listDomains   = json['domains'] as List;

    List<TopicItem> topics = listTopics
        .map((topicItems) => TopicItem.fromJson(topicItems))
        .toList();

    List<OverviewItem> overviews = listOverviews
        .map((overviewItems) => OverviewItem.fromJson(overviewItems))
        .toList();

    List<PlanItem> plans = listPlans
       .map((planItems) => PlanItem.fromJson(planItems))
       .toList();

   List<LearningItem> learnings = listLearnings
       .map((learningItems) => LearningItem.fromJson(learningItems))
       .toList();

    List<DomainItem> domains = listDomains
        .map((domainItems) => DomainItem.fromJson(domainItems))
        .toList();

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
      topics: topics,
      overviews: overviews,
      plans: plans,
      learnings: learnings,
      domains: domains,
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
    var list = json['exams'] as List;

    List<CertificationItem> products = list
        .map((productItems) => CertificationItem.fromJson(productItems))
        .toList();

    return Certifications(certificationItem: products);
  }
}
// Certifications
// -----------------------------------------------------------------------------
// List<CertificationItem> professional = [];
// List<CertificationItem> associate = [];
// List<CertificationItem> foundational = [];
// List<CertificationItem> fellow = [];