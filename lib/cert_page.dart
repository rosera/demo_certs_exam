import 'package:demo_cert_exam/cert_details.dart';
import 'package:flutter/material.dart';
import 'model/cert_model.dart';
import 'utility/utility.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CertificationPage extends StatefulWidget {
  // final Certifications providerCertifications;

  // This widget is the root of your application.
  // const CertificationPage({super.key, required this.providerCertifications});
  const CertificationPage({super.key});

  @override
  State<CertificationPage> createState() => _CertificationPageState();
}

class _CertificationPageState extends State<CertificationPage> {
  late Future<Certifications> _certifications;
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _certifications = fetchCertifications();
  }

  // Method: Load RemoteData
  // Description: Perform async HTTP.GET on endpoint and return result
  // -----------------------------------------------------------------------------

  Future<String> loadRemoteData(String endpointUrl) async {
    final response = await (http.get(Uri.parse(endpointUrl)));

    // // Ensure HTTP response is statusCode 200
    // if (response.statusCode == 200) {
    //   print('HTTP 200');
    // }

    // Handle condition where HTTP response is NOT statusCode 200
    if (response.statusCode != 200) {
      // print('Hmm, something went wrong ${response.statusCode}');
      throw Exception('Invalid data source: $endpointUrl');
    }

    return response.body;
  }

  // TODO: Certifications + Links
  Future<Certifications> fetchCertifications() async {
    // TODO: Restrict the loader to one time
    // if (isCertificationFirstTime){
    // Add await to transition Future<String> to String
    String productList = await loadRemoteData(
        'https://storage.googleapis.com/roselabs-poc-images/radarr-app/certin.json');
    // Decode the string into a json object
    final jsonResponse = json.decode(productList);

    // Process the product information using the Class ProductItem
    Certifications providerCertifications =
        Certifications.fromJson(jsonResponse);

//    for (CertificationItem cert in providerCertifications.certificationItem) {
    //
    //   // TODO: Set Favourite default
    //   // print('Fav is being set');
    //   favoritesCertificationMap[cert.tag] = false;
    //
    //   if (cert.level == "Professional") {
    //     professional.add(cert);
    //   } else if (cert.level == "Associate") {
    //     associate.add(cert);
    //   } else if (cert.level == "Foundational") {
    //     foundational.add(cert);
    //   } else if (cert.level == "Fellow") {
    //     fellow.add(cert);
    //   }
    // }
//    }

    // TODO: Set the flag
    // isCertificationFirstTime = false;

    // return true;
    return providerCertifications;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: const Text('GCP Certifications'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: selectedFilter == 'All',
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = 'All';
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Professional'),
                  selected: selectedFilter == 'Professional',
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = 'Professional';
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Associate'),
                  selected: selectedFilter == 'Associate',
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = 'Associate';
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Foundational'),
                  selected: selectedFilter == 'Foundational',
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = 'Foundational';
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<Certifications>(
              future: _certifications,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.certificationItem.isEmpty) {
                  return const Center(child: Text('No Google Cloud certifications found.'));
                }

                // final releaseNotes = snapshot.data!;
                // Filter release notes based on selected chip
                final certificationExam = snapshot.data!.certificationItem.where((certificationItem) {
                  if (selectedFilter == 'All') return true;
                  return certificationItem.level == selectedFilter;
                }).toList();

                return ListView.builder(
                  itemCount: certificationExam.length,
                  itemBuilder: (context, index) {
                    final examItem = certificationExam[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CertificationDetailPage(
                                note: certificationExam[index],
                              ))
                          );
                        },
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
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // Product Title
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 2.0, 0.0),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    // "${releaseNote.productTitle} release notes: ${releaseNote.productReleaseNotes.length}",
                                    "${examItem.title}",
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // Text(examItem.level),
                                // Text(examItem.header),
                                // Text(examItem.questions),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                                  child: Text(
                                    examItem.description,
                                    maxLines: 50,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Labels (Announcement, Fixed, Security)
                                      // buildSectionLabels(examItem.level),
                                      buildSectionCertLabels(examItem.level, examItem.image),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                  child: Text("Level: ${examItem.level} | Cost: \$${examItem.cost} | Duration: ${examItem.duration}",
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
