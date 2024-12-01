import 'package:demo_cert_exam/pages/cert_tab.dart';
import 'package:demo_cert_exam/pages/media_tab.dart';
import 'package:demo_cert_exam/pages/plan_tab.dart';
import 'package:demo_cert_exam/pages/topic_tab.dart';
import 'package:flutter/material.dart';
import 'model/cert_model.dart';

class CertificationHomePage extends StatefulWidget {
  final CertificationItem certification;

  // This widget is the root of your application.
  const CertificationHomePage({super.key, required this.certification});

  @override
  State<CertificationHomePage> createState() => _CertificationHomePageState();
}

class _CertificationHomePageState extends State<CertificationHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.certification.title), // The title passed as a parameter
          // toolbarHeight: 15.0,
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.cyanAccent,
            labelColor: Colors.cyanAccent,

            isScrollable: true,
            labelStyle: TextStyle(fontSize: 16.0),
            tabs: [
              Tab(text: 'Certification'),
              Tab(text: 'Topics'),
              Tab(text: 'Plan'),
              Tab(text: 'Media'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CertificationTabPage(cert: widget.certification),
            Text("Topics"),
            Text("Plans"),
            Text("Media"),
            // TopicTabPage(cert: widget.certification),
            // PlanTabPage(cert: widget.certification),
            // MediaTabPage(cert: widget.certification),
          ],
        ),
      ),
    );
  }
}




