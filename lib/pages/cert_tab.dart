import 'package:flutter/material.dart';
import '../model/cert_model.dart';

class CertificationTabPage extends StatelessWidget {
  final CertificationItem cert;

  const CertificationTabPage({super.key, required this.cert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(note.title), // The title passed as a parameter
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  color: Colors.grey.withOpacity(0.25),
                  // Set the opacity to 0.5 (50%)
                  width: 1.0,
                ),
              ),
        
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                    child: SizedBox(
                      width: 150,
                      child: Image(
                        image: Image.network(cert.image).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Exam",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Level: ${cert.level}",
                          style: const TextStyle(
                            fontSize: 14.0,
                          )),
                      Text("Cost: \$${cert.cost}",
                          style: const TextStyle(
                            fontSize: 14.0,
                          )),
                      Text("Duration: ${cert.duration}",
                          style: const TextStyle(
                            fontSize: 14.0,
                          )),
                      Text("Experience: ${cert.experience}",
                          style: const TextStyle(
                            fontSize: 14.0,
                          )),
                    ],
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 10.0),
            // TODO: ADD HEADER
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Text('Description',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10.0),
        
            // TODO: ADD OVERVIEW
            Card(
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(cert.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),),
              ),
            ),
            const SizedBox(height: 10.0),
        
          ],
        ),
      ),
    );
  }
}
