import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/pages/error_page.dart';

import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/loading_page.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_repository.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  WeatherRepository weatherRepository = WeatherRepository();

  void loading() async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    await weatherRepository
        .getWeather(position.latitude, position.longitude)
        .then((value) {
      print("loaded weather");
      print(weatherRepository.loadedWeather);
      setState(() => isLoading = false);
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void initState() {
    loading();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kali-Weather",
      home: isLoading
          ? LoadingPage()
          : HomePage(
              weather: weatherRepository.loadedWeather,
            ),
      routes: {
        '/loading': ((BuildContext context) => LoadingPage()),
        '/home': ((BuildContext context) => HomePage()),
      },
    );
  }
}
