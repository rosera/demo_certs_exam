// import 'package:demo_cert_exam/cert_page.dart';
import 'package:demo_cert_exam/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../utility/const.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  final      TextEditingController _codeController = TextEditingController();
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.5, end: 1.0)
        .animate(_controller.drive(CurveTween(curve: Curves.easeOutSine)));
  }

  // void _navigateToNextScreen(BuildContext context) {
  void _navigateToNextScreen(BuildContext context) {
    // When navigating:
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
          // Add: Page to navigate to
          const HomePage(), // Pass the value directly
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                AnimatedBuilder(
                  animation: _animation,
                  child: Image.network(
                    // TODO: Match Name
                    appLogo,
                    height: 350,
                  ),
                  builder: (context, child) => Transform.translate(
                    offset: const Offset(1.0, 0), // Or your desired offset
                    child: Transform.scale(
                      scale: .25 + _animation.value,
                      // Your scaling animation
                      child: Transform.rotate(
                        angle: _animation.value * 4 * 3.142,
                        child: child,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'C E R T - I N',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Certification Resource Guide.',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Button to navigate to the next screen
                ElevatedButton(
                  onPressed: () => _navigateToNextScreen(context),
                  style: ElevatedButton.styleFrom(
                    // Optional: Set the background color of the button itself
                    backgroundColor: Colors.white12,
                    // Define the shape with curved corners
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                    ),
                    // Optional: You might need to set minimumSize if the child's width doesn't fully dictate the button's size
                    minimumSize: const Size(170, 0), // Set minimum width, height can be dynamic
                  ),
                  child: const Center(
                    child: Text(
                      'Click here to begin',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
