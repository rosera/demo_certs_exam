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
              Tab(text: 'Education'),
              Tab(text: 'Plan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CertificationTabPage(note: widget.certification),
            TopicTabPage(note: widget.certification),
            MediaTabPage(note: widget.certification),
            PlanTabPage(note: widget.certification),
          ],
        ),
      ),
    );
  }
}



class CertificationTabPage extends StatelessWidget {
  final CertificationItem note;

  const CertificationTabPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(note.title), // The title passed as a parameter
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),

          // TODO: ADD HEADER
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Text('Overview',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10.0),

          // TODO: ADD OVERVIEW
          SizedBox(
            // height: 300,
            child: Card(
              // color: Colors.transparent,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                // Adjust the radius as needed
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  // Set the opacity to 0.5 (50%)
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(note.description,
                        style: const TextStyle(
                          fontSize: 16.0,
                    ),),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10.0),
          // TODO: ADD HEADER
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Text('Credential',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10.0),

          // TODO: CREDENTIAL
          Card(
            // color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              // Adjust the radius as needed
              side: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                // Set the opacity to 0.5 (50%)
                width: 1.0,
              ),
            ),

            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                    child: Image(
                      image: Image.network(note.image).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Exam",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Level: ${note.level}",
                        style: const TextStyle(
                          fontSize: 14.0,
                        )),
                    Text("Cost: \$${note.cost}",
                        style: const TextStyle(
                          fontSize: 14.0,
                        )),
                    Text("Duration: ${note.duration}",
                        style: const TextStyle(
                          fontSize: 14.0,
                        )),
                    Text("Experience: ${note.experience}",
                        style: const TextStyle(
                          fontSize: 14.0,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<String> topics = [
  "Section One",
  "Section Two",
  "Section Three",
  "Section Four",
  "Section Five",
];

class TopicTabPage extends StatelessWidget {
  final CertificationItem note;

  const TopicTabPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(note.title), // The title passed as a parameter
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),

          // TODO: ADD HEADER
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Text('Section',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10.0),

          // TODO: Display Topics
          Expanded(
            child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                 return Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Text(topics[index].toString()),
                 );
                 // return const Text("Hello Topic");
                }
            ),
          )
        ],
      ),
    );
  }
}

List<String> media = [
  "Courses",
  "Videos",
  "Books",
  "Blogs",
  "Other",
];

class MediaTabPage extends StatelessWidget {
  final CertificationItem note;

  const MediaTabPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(note.title), // The title passed as a parameter
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),

          // TODO: ADD HEADER
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Text('Content',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10.0),

          // TODO: Display Topics
          Expanded(
            child: ListView.builder(
                itemCount: media.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(media[index].toString()),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

List<String> plan = [
  "Timetable",
  "Analytics",
  "Other",
];

class PlanTabPage extends StatelessWidget {
  final CertificationItem note;

  const PlanTabPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(note.title), // The title passed as a parameter
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),

          // TODO: ADD HEADER
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Text('Schedule',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10.0),

          // TODO: Display Topics
          Expanded(
            child: ListView.builder(
                itemCount: plan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(plan[index].toString()),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
