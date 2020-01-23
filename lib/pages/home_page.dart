import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_repository.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  final Weather weather;

  HomePage({Key key, this.weather}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0x90cccccc),
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        '${(widget.weather.temperature - 273.15)}°C',
                        style: TextStyle(
                            fontSize: 72,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        '${widget.weather.town}\n'
                            '  ${widget.weather.description}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
