import 'package:flutter/material.dart';

class ResultsShowPage extends StatefulWidget {
  final String distance;

  const ResultsShowPage({
    super.key,
    required this.distance,
  });

  @override
  _ResultsShowPageState createState() => _ResultsShowPageState();
}

class _ResultsShowPageState extends State<ResultsShowPage> {
  late String _carTravelTime = '';
  late String _bikeTravelTime = '';
  late String _tukTukTravelTime = '';

  @override
  void initState() {
    super.initState();
    _calculateTravelTimes();
  }

  void _calculateTravelTimes() {
    // Calculate travel times for car, bike, and tuk-tuk modes
    _carTravelTime = _calculateTravelTime('car');
    _bikeTravelTime = _calculateTravelTime('bike');
    _tukTukTravelTime = _calculateTravelTime('tuk-tuk');
  }

  String _calculateTravelTime(String mode) {
    double speed = 0.0;
    switch (mode) {
      case 'car':
        speed = 50; // Average car speed in km/h
        break;
      case 'bike':
        speed = 15; // Average bike speed in km/h
        break;
      case 'tuk-tuk':
        speed = 30; // Average tuk-tuk speed in km/h
        break;
    }
    double distanceInKm = double.parse(widget.distance);
    double travelTimeInHours = distanceInKm / speed;

    // Convert travel time to hours and minutes
    int travelTimeHours = travelTimeInHours.toInt();
    int travelTimeMinutes =
        ((travelTimeInHours - travelTimeHours) * 60).toInt();

    // Return travel time in hours and minutes format
    return '${travelTimeHours}h ${travelTimeMinutes}min';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Distance: ${widget.distance} km'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showTravelTime(_carTravelTime, 'Car');
              },
              child: Text('Calculate Car Time'),
            ),
            ElevatedButton(
              onPressed: () {
                _showTravelTime(_bikeTravelTime, 'Bike');
              },
              child: Text('Calculate Bike Time'),
            ),
            ElevatedButton(
              onPressed: () {
                _showTravelTime(_tukTukTravelTime, 'Tuk-Tuk');
              },
              child: Text('Calculate Tuk-Tuk Time'),
            ),
          ],
        ),
      ),
    );
  }

  void _showTravelTime(String travelTime, String mode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$mode Travel Time'),
          content: Text('Estimated travel time: $travelTime'),
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
