import 'package:flutter/material.dart';
import '../model/cert_model.dart';


List<String> media = [
  "Courses",
  "Videos",
  "Books",
  "Blogs",
  "Quizzes",
  "Other",
];

class MediaTabPage extends StatelessWidget {
  final CertificationItem cert;

  const MediaTabPage({super.key, required this.cert});

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
