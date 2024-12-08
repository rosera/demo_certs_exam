import 'package:flutter/material.dart';
import '../model/cert_model.dart';
import '../utility/utility.dart';

List<String> topics = [
  "Section One",
  "Section Two",
  "Section Three",
  "Section Four",
  "Section Five",
];

class SummaryTabPage extends StatelessWidget {
  final CertificationItem cert;

  const SummaryTabPage({super.key, required this.cert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(note.title), // The title passed as a parameter
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 10.0),

          // TODO: ADD HEADER
          // const Padding(
          //   padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          //   child: Text('Topics',
          //       style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          // ),
          // const SizedBox(height: 10.0),

          // TODO: Display Topics
          Expanded(
            child: ListView.builder(
                itemCount: cert.domains.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    // height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        // color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          // Adjust the radius as needed
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.25),
                            // Set the opacity to 0.5 (50%)
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text("${cert.domains[index]!.heading}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: buildDomainCertLabels(cert.domains[index]!.percent, cert.image),
                                ),
                              ],
                            ),

                            SizedBox(
                              // TODO: Set the SizedBox to legnth of topics
                              height: 70.0 * cert.domains[index]!.topics.length,
                              // TODO: Dynamic height
                              // height: 300,
                              child: MyDomainDetails(domains: cert.domains[index]!.topics),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }

}

// Assuming you have the Domain class defined from the previous response
class MyDomainDetails extends StatefulWidget {
  final List<String> domains;

  const MyDomainDetails({super.key, required this.domains});

  @override
  State<MyDomainDetails> createState() => _MyDomainDetailsState();
}

class _MyDomainDetailsState extends State<MyDomainDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: widget.domains.length,
        itemBuilder: (context, index) {
          // Access the current Domain object
          final domain = widget.domains[index];

          return Column( // Wrap each topic in a Column for spacing
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${index+1}. ${domain}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}