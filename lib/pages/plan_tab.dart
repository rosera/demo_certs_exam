// import 'package:flutter/material.dart';
// import '../model/cert_model.dart';
//
// class PlanTabPage extends StatelessWidget {
//   final CertificationItem cert;
//
//   const PlanTabPage({super.key, required this.cert});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(note.title), // The title passed as a parameter
//       // ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 10.0),
//
//           // TODO: ADD HEADER
//           const Padding(
//             padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
//             child: Text('Schedule',
//                 style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(height: 10.0),
//
//           // TODO: Display Topics
//           Expanded(
//             child: ListView.builder(
//                 itemCount: cert.plans.length,
//                 itemBuilder: (context, index) {
//                   return SizedBox(
//                     // height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         // color: Colors.transparent,
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           // Adjust the radius as needed
//                           side: BorderSide(
//                             color: Colors.grey.withOpacity(0.25),
//                             // Set the opacity to 0.5 (50%)
//                             width: 1.0,
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               // child: Text("${cert.plans[index]!.tag}. ${cert.plans[index]!.title}",
//                               child: Text("TBC",
//                                 style: const TextStyle(
//                                   fontSize: 18.0,
//                                 ),),
//                             ),
//
//                             Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               // child: Text(cert.plans[index]!.description,
//                               child: Text("TBC",
//                                 style: const TextStyle(
//                                   fontSize: 16.0,
//                                   color: Colors.white60,
//                                 ),),
//                             ),
//
//                             Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               // child: Text(cert.plans[index]!.topic,
//                               child: Text("TBC",
//                                 style: const TextStyle(
//                                   fontSize: 16.0,
//                                   color: Colors.white60,
//                                 ),),
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                   // return Padding(
//                   //   padding: const EdgeInsets.all(16.0),
//                   //   child: Text(cert.plans[index].title!),
//                   // );
//                 }
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
