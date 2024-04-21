import 'package:flutter/material.dart';
import '../../../Components/spacer.dart';
import '../../../Declarations/Constants/constants.dart';

import '../Widget/a_header_widget.dart';
import '../Widget/b_swiper_widget.dart';
import 'package:island_way/login.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final String? distance;
  const MyHomePage({
    Key? key,
    required this.title,
    this.distance,
  }) : super(key: key);

  // Define variables to hold fuel consumption per liter, fuel price, and total cost
  static const Map<String, Map<String, double>> vehicleDetails = {
    'Car': {'consumption': 16, 'price': 371.00},
    'Bike': {'consumption': 40, 'price': 371.00},
    'Tuk Tuk': {'consumption': 17, 'price': 371.00},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
              // Add your logout functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardLayout(),
            HeightSpacer(myHeight: kSpacing),
            const Padding(
              padding: EdgeInsets.only(
                  left: 20), // Adjust the left padding as needed
              child: Text(
                'Select a vehicle to view details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Change the color if needed
                ),
              ),
            ),
            _buildTravelTimeButton(context, 'Car'),
            _buildTravelTimeButton(context, 'Bike'),
            _buildTravelTimeButton(context, 'Tuk Tuk'),
            HeightSpacer(myHeight: kSpacing),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelTimeButton(BuildContext context, String vehicle) {
    late String travelTime;
    late String distance;
    late IconData iconData;

    switch (vehicle) {
      case 'Car':
        travelTime = _calculateTravelTime('car');
        distance = this.distance ?? '0';
        iconData = Icons.directions_car;
        break;
      case 'Bike':
        travelTime = _calculateTravelTime('bike');
        distance = this.distance ?? '0';
        iconData = Icons.two_wheeler;
        break;
      case 'Tuk Tuk':
        travelTime = _calculateTravelTime('tuk-tuk');
        distance = this.distance ?? '0';
        iconData = Icons.travel_explore_outlined;
        break;
      default:
        travelTime = '';
        distance = '';
        iconData = Icons.error;
    }

    return SizedBox(
      width: double.infinity, // Set width to full screen width
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20), // Add padding for better appearance
        child: ElevatedButton.icon(
          onPressed: () {
            _showTravelTime(context, travelTime, vehicle, distance);
          },
          icon: Icon(
            iconData,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          label: Text(
            '$vehicle',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(
                255, 61, 155, 92), // Use primary instead of backgroundColor
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  String _calculateTravelTime(String mode) {
    double speed = 0.0;
    switch (mode) {
      case 'car':
        speed = 50; // Average car speed in km/h
        break;
      case 'bike':
        speed = 60; // Average bike speed in km/h
        break;
      case 'tuk-tuk':
        speed = 40; // Average tuk-tuk speed in km/h
        break;
    }
    double distanceInKm = double.parse(distance ?? '0');
    double travelTimeInHours = distanceInKm / speed;

    // Convert travel time to hours and minutes
    int travelTimeHours = travelTimeInHours.toInt();
    int travelTimeMinutes =
        ((travelTimeInHours - travelTimeHours) * 60).toInt();

    // Return travel time in hours and minutes format
    return '${travelTimeHours}h ${travelTimeMinutes}min';
  }

  void _showTravelTime(BuildContext context, String travelTime, String mode,
      String distanceString) {
    final details = vehicleDetails[mode]!;
    final fuelConsumption = details['consumption']!;
    final fuelPrice = details['price']!;

    // Parse the distance string to double
    final distance = double.tryParse(distanceString) ?? 0.0;

    // Calculate total fuel cost
    final totalFuelCost = (distance / fuelConsumption) * fuelPrice;

    // Calculate total fuel needed
    final totalFuelNeeded = distance / fuelConsumption;

    // Convert total fuel cost and total fuel needed to string
    final totalFuelCostString = totalFuelCost.toStringAsFixed(2);
    final totalFuelNeededString = totalFuelNeeded.toStringAsFixed(2);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Full Cost Details of Your Journey',
            style: TextStyle(
                fontSize: 15, color: primaryColor, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Distance: $distanceString km'),
              SizedBox(height: 10),
              Text('Estimated travel time: $travelTime'),
              SizedBox(height: 10),
              Text('Fuel consumption per liter: $fuelConsumption km/L'),
              SizedBox(height: 10),
              Text('Fuel price: Rs. $fuelPrice'),
              SizedBox(height: 10),
              Text('Total fuel needed: $totalFuelNeededString L'),
              SizedBox(height: 30),
              Text(
                'Total fuel cost: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Rs. $totalFuelCostString'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class CardLayout extends StatelessWidget {
  const CardLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
          HeightSpacer(myHeight: kSpacing),
          const HeaderWidgets(),
          HeightSpacer(myHeight: kSpacing / 2),
          const SwiperBuilder(),
        ],
      ),
    );
  }
}
