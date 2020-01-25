import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/loading_page.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kali-Weather",
      home: LoadingPage(),
      routes: {
        '/home': ((BuildContext context) => HomePage()),
        '/loading': ((BuildContext context) => LoadingPage()),
      },
    );
  }
}
