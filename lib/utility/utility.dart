import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

// TODO: Add label for Domain
Widget buildDomainCertLabels(String content, String imageLink) {
  return _buildDomainLabel(content, imageLink, Colors.blueGrey);
}

Widget _buildDomainLabel(String label, String image, Color color) {
  return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: badges.Badge(
      badgeStyle: badges.BadgeStyle(badgeColor: color),
      badgeContent: Text(
        label,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 10
        ),
      ),
      position: badges.BadgePosition.topEnd(top: -10, end: -20),
      child: SizedBox(
        width: 50,
        child: Image(
          image: Image.network(image).image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

// TODO: Add label for Certification
Widget buildSectionCertLabels(String content, String imageLink) {
  if (content.contains('Professional')) {
    return _buildCertLabel('P', imageLink, Colors.green);
  } else if (content.contains('Associate')) {
    return _buildCertLabel('A', imageLink, Colors.blueGrey);
  } else if (content.contains('Foundational')) {
    return _buildCertLabel('F', imageLink, Colors.deepOrange);
  } else if (content.contains('Fellow')) {
    return _buildCertLabel('F', imageLink, Colors.teal);
  } else {
    return const SizedBox();
  }
}

Widget _buildCertLabel(String label, String image, Color color) {
  return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: badges.Badge(
      // badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
      badgeStyle: badges.BadgeStyle(badgeColor: color),
      badgeContent: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      position: badges.BadgePosition.topEnd(top: -10, end: -4),
      // child: const Icon(Icons.event_note_outlined, size: 40),
      // child: const Icon(Icons.person, size: 40),
      child: SizedBox(
        width: 50,
        child: Image(
          image: Image.network(image).image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

// Method: stripNonPrintingCharacters
// Strip Non Printing characters.
// Description: Remove non-printing characters from a string
//-----------------------------------------------------------------------------
String stripNonPrintingCharacters(String str) {
  final regExp = RegExp('[^\x20-\x7E]');
  return str.replaceAll(regExp, '');
}
