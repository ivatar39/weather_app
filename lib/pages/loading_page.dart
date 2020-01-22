import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/pages/error_page.dart';
import 'package:weather_app/pages/home_page.dart';

import '../constants.dart';
import '../weather.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
//    final result = DataConnectionChecker();
//
//    await result.hasConnection.then((v) {
//      v == true
//          ? loading()
//          : Navigator.pushReplacement(
//              context,
//              MaterialPageRoute(
//                  builder: (BuildContext context) => ErrorPage()));
//    }).catchError((error) {
//      print(error);
//
//      print(58);
//
//      Navigator.pushReplacement(context,
//          MaterialPageRoute(builder: (BuildContext context) => ErrorPage()));
//    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
