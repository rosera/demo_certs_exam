import 'package:flutter/material.dart';
import 'model/cert_model.dart';

class CertificationDetailPage extends StatelessWidget {
  final CertificationItem note;

  const CertificationDetailPage({Key? key, required this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title), // The title passed as a parameter
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // TODO: ADD HEADER
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: const Text('Overview',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.0),

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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(note.description,
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                  ),
                  // SizedBox(height: 10),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    //   child: Text("Date: ${note.title}",
                    child: Text(
                        "Level: ${note.level} | Cost: \$${note.cost} | Duration: ${note.duration}",
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10.0),
          // TODO: ADD HEADER
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: const Text('Credential',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.0),

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
                    width: 150,
                    child: Image(
                      image: Image.network(note.image).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Level: ${note.level}",
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    Text("Cost: \$${note.cost}",
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    Text("Duration: ${note.duration}",
                        style: TextStyle(
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
