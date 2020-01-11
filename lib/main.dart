import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/loading_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  void loading() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
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
      home: isLoading ? LoadingPage() : HomePage(),
      routes: {
        '/home': ((BuildContext context) => HomePage()),
        '/loading': ((BuildContext context) => LoadingPage()),
      },
    );
  }
}
