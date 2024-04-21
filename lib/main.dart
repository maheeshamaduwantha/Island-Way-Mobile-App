import 'package:flutter/material.dart';
// import 'package:island_way/screens/map_page.dart';
// import 'package:island_way/Presentation/Screens/HomePage/UI/home_page.dart';
import 'package:island_way/splash.dart';
// Import the RouteGenerator class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Island Way',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MapView(),
      // routes: {
      //   '/my_home_page': (context) => const MyHomePage(title: 'My Home Page'),
      // },
      home: const Splash(),
    );
  }
}
