import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage

class ThirdHomeScreen extends StatefulWidget {
  const ThirdHomeScreen({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _ThirdHomeScreenState createState() => _ThirdHomeScreenState();
}

class _ThirdHomeScreenState extends State<ThirdHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/third_home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 70.0, // Adjust the bottom padding as needed
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Never',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Run Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Know exactly how much fuel you need for any trip and where to find the best prices.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 70.0, // Adjust the top padding as needed
            right: 30.0, // Adjust the right padding as needed
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 1.0,
              ), // Add padding around the button
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
