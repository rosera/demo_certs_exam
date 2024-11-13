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

    for (CertificationItem cert in providerCertifications.certificationItem) {
    //
    //   // TODO: Set Favourite default
    //   // print('Fav is being set');
    //   favoritesCertificationMap[cert.tag] = false;
    //
      if (cert.level == "Professional") {
        professional.add(cert);
      } else if (cert.level == "Associate") {
        associate.add(cert);
      } else if (cert.level == "Foundational") {
        foundational.add(cert);
      } else if (cert.level == "Fellow") {
        fellow.add(cert);
      }
    // }
    }

    // TODO: Set the flag
    // isCertificationFirstTime = false;

    // return true;
    return providerCertifications;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 15.0,
          bottom: const TabBar(
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 16.0),
            tabs: [
              Tab(text: 'Professional'),
              Tab(text: 'Associate'),
              Tab(text: 'Foundational'),
              Tab(text: 'Fellow'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CertificationTab(providerCertifications: professional),
            CertificationTab(providerCertifications: associate),
            CertificationTab(providerCertifications: foundational),
            CertificationTab(providerCertifications: fellow),
          ],
        ),
      ),
    );
  }
}

class CertificationTab extends StatelessWidget {
  final List<CertificationItem> providerCertifications;

// This widget is the root of your application.
  const CertificationTab({super.key, required this.providerCertifications});

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double deviceWidth = queryData.size.width;

    return ListView.builder(
      itemCount: providerCertifications.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12, width: 1.0),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // Row with image, divider, and text fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image(
                          image:
                              Image.network(providerCertifications[index].image)
                                  .image,
                          width: (deviceWidth / 3),
                          height: (deviceWidth / 3),
                          fit: BoxFit.scaleDown,
                          // alignment: Alignment.centerLeft,
                        ),
                        //child: Image.network('https://storage.googleapis.com/roselabs-poc-images/google-cloud-256.png'),
                      ),
                      const VerticalDivider(width: 5),
                      const SizedBox(width: 10.0),
                      // Two text in a column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: deviceWidth - (deviceWidth / 3),
                            child: Text(
                              providerCertifications[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Level: ${providerCertifications[index].level}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            width: deviceWidth - (deviceWidth / 3),
                            child: Text(
                              stripNonPrintingCharacters(
                                  providerCertifications[index].description),
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: deviceWidth - (deviceWidth / 3),
                            child: Text(
                              'Cost: ${providerCertifications[index].cost} | Duration: ${providerCertifications[index].duration} | Questions: ${providerCertifications[index].questions}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Links at the bottom of the card
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                const Text(
                                  'Exam',
                                  style: TextStyle(fontSize: 12),
                                ),
                                IconButton(
                                  onPressed: () {
//                                                 launch('https://cloud.google.com/natural-language/docs?hl=en_US');
                                  },
                                  icon: const Icon(Icons.link),
                                ),
                              ]),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  const Text(
                                    'Guide',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  IconButton(
                                    onPressed: () {
//                                               launch('https://cloud.google.com/natural-language/docs/quickstart?hl=en_US');
                                    },
                                    icon: const Icon(Icons.link),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  const Text(
                                    'Register',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  IconButton(
                                    onPressed: () {
//                                               launch('https://cloud.google.com/natural-language/docs/quickstart?hl=en_US');
                                    },
                                    icon: const Icon(Icons.link),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
//                                       const SizedBox(height: 2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
