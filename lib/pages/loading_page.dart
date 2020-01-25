import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../weather.dart';
import '../weather_repository.dart';
import 'home_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool isLoading = true;
  WeatherRepository weatherRepository;
  Weather weather;

  void loading() async {
    weatherRepository = WeatherRepository();
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    print("${position.longitude} ${position.latitude} ");

    try {
      weather = await weatherRepository.getWeather(
          position.latitude, position.longitude);
      print(weather.main);
    } catch (e) {
      print(e);
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomePage(
                  weather: weather,
                )));
  }

  @override
  void initState() {
    loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
