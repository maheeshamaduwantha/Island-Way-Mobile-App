import 'package:flutter/material.dart';
import 'thirdhome.dart'; // Import the ThirdHomeScreen

class SecondHomeScreen extends StatefulWidget {
  const SecondHomeScreen({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _SecondHomeScreenState createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/second_home.jpg'),
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
                    'Travel Smart, Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Money',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Find the most efficient routes, Compare prices, and choose Eco-Friendly options.',
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
                      builder: (context) => const ThirdHomeScreen(title: ''),
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
