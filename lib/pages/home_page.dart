import 'package:demo_cert_exam/cert_page.dart';
import 'package:flutter/material.dart';
import '../model/cert_model.dart';
import '../utility/const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // You might manage the selected tab here if they are interactive
  int _selectedIndex = 2; // Assuming Certifications is the 3rd item (index 2)
  late Future<Certifications> _certifications;

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
      // TODO: Provider Exams
      'https://storage.googleapis.com/roselabs-poc-images/radarr-app/google-cloud-r2.json');
    // Decode the string into a json object
    final jsonResponse = json.decode(productList);

    // Process the product information using the Class ProductItem
    Certifications providerCertifications = Certifications.fromJson(jsonResponse);

    // return true;
    return providerCertifications;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add navigation logic here based on index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xFF1E2136), // Match scaffold background
        elevation: 0,
//        leading: IconButton(
//          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//          onPressed: () {
//            // Handle back button press
//          },
//        ),
        title: const Text(
          'Certifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              const SizedBox(height: 16.0),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search certifications',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: const Color(0xFF2C3048), // A slightly lighter dark color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              Wrap(
                spacing: 8.0,
                children: [
                  const ChoiceChip(
                    label: const Text('All'),
                    selected: false,
                  ),
                  ChoiceChip(
                    label: const Text('Popular'),
                    selected: false,
                  ),
                  const ChoiceChip(
                    label: const Text('New'),
                    selected: false,
                  ),
                  ChoiceChip(
                    label: const Text('Recommended'),
                    selected: false,
                  ),
                ],
              ),             // Category Tabs
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     _buildTab('All', true), // Assuming 'All' is selected initially
              //     _buildTab('Popular', false),
              //     _buildTab('New', false),
              //     _buildTab('Recommended', false),
              //   ],
              // ),
              const SizedBox(height: 30.0),

              // Favorites Section
              const Text(
                'Favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200, // Adjust height as needed for cards
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFavoriteCertificationCard(
                      'Professional Cloud Architect',
                      'Google Cloud Architect curriculum',
                      // 'assets/certification_logo_1.png', // Replace with your image asset
                      'https://storage.googleapis.com/roselabs-poc-images/certin-radarr/images/google/gcp-arch-badge.png', // Replace with your image asset
                    ),
                    const SizedBox(width: 16.0),
                    _buildFavoriteCertificationCard(
                      'Certified Kubernetes Administrator',
                      'CNCF Kubernetes specialist curriculum',
                      // 'assets/certification_logo_2.png', // Replace with your image asset
                      'https://storage.googleapis.com/roselabs-poc-images/certin-radarr/images/cncf/cka-badge.png', // Replace with your image asset
                    ),
                    const SizedBox(width: 16.0),
                    // Add more favorite cards as needed
                  ],
                ),
              ),
              const SizedBox(height: 30.0),

              // All Certifications Section
              const Text(
                'All Certifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              _buildAllCertificationTile(
                'Google Certified Cloud Architect',
                'Validate your expertise in cloud computing',
                // 'assets/gcp_logo.png', // Replace with your image asset
                'https://storage.googleapis.com/roselabs-poc-images/certin-radarr/images/google/gcp-arch-badge.png', // Replace with your image asset
              ),
              const SizedBox(height: 12.0),
              _buildAllCertificationTile(
                'CNCF Kubernetes Certification',
                'Demonstrate your skills in Kubernetes',
                // 'assets/cka_logo.png', // Replace with your image asset
                'https://storage.googleapis.com/roselabs-poc-images/certin-radarr/images/cncf/cka-badge.png', // Replace with your image asset
              ),
              const SizedBox(height: 12.0),
              _buildAllCertificationTile(
                'Google Certified Network Engineer',
                'Demonstrate your skills in cybersecurity',
                // 'assets/cissp_logo.png', // Replace with your image asset
                'https://storage.googleapis.com/roselabs-poc-images/certin-radarr/images/google/gcp-ne-badge.png', // Replace with your image asset
              ),
              const SizedBox(height: 12.0),
              _buildAllCertificationTile(
                'AWS Certified Solution Architect',
                'Showcase your knowledge in cloud computing',
                // 'assets/aws_logo.png', // Replace with your image asset
                'https://storage.googleapis.com/roselabs-poc-images/certin-radarr/images/aws/aws-psa-badge.png', // Replace with your image asset
              ),
              const SizedBox(height: 20.0), // Padding at the bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // To show all labels
        backgroundColor: const Color(0xFF1E2136), // Match scaffold background
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined), // Or a book icon
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership), // Or a certification icon
            label: 'Certifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4A4E6C) : const Color(0xFF2C3048), // Selected vs unselected background
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildFavoriteCertificationCard(String title, String subtitle, String imagePath) {
    return Container(
      width: 180, // Adjust width as needed
      decoration: BoxDecoration(
        color: const Color(0xFF2C3048),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              // child: Image.asset(
              child: Image.network(
                imagePath,
                height: 80, // Adjust logo size
                width: 80,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            SizedBox(
              height: 20,
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllCertificationTile(String title, String subtitle, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C3048),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.blueGrey.withValues(alpha: 0.25), // Or a specific background for the logo
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            // child: Image.asset(
            child: Image.network(
              imagePath,
              width: 42, // Adjust size of the logo inside the container
              height: 42,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            // color: Colors.white.withOpacity(0.7),
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 12.0,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          // color: Colors.white.withValues(alpha: 0.5),
          color: Colors.white,
          size: 16.0,
        ),
        onTap: () {
          // Handle tile tap
        },
      ),
    );
  }
}
