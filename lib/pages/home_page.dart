import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_repository.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  final Weather weather;
  var date = DateTime.now();
  String weekday;
  IconData icon = FontAwesomeIcons.sun;

  HomePage({Key key, this.weather}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print('init');
    if((widget.date.hour >= 20 && widget.date.hour <= 23)|| (widget.date.hour >= 0 && widget.date.hour <= 9)){
      widget.icon = FontAwesomeIcons.moon;
    }
    else widget.icon = FontAwesomeIcons.sun;
    switch (widget.date.weekday) {
      case 1:
        widget.weekday = 'Monday';
        break;

      case 2:
        widget.weekday = 'Tuesday';
        break;

      case 3:
        widget.weekday = 'Wednesday';
        break;

      case 2:
        widget.weekday = 'Thursday';
        break;

      case 2:
        widget.weekday = 'Friday';
        break;

      case 2:
        widget.weekday = 'Saturday';
        break;

      case 2:
        widget.weekday = 'Sunday';
        break;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          pinned: false,
          snap: true,
          expandedHeight: 300.0,
          title: Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.more.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
          floating: true,
          stretch: true,
          backgroundColor: Colors.blueAccent,
          flexibleSpace: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Text(
                    '${(widget.weather.temperature - 273.15).toInt()}°C',
                    style: TextStyle(fontSize: 100.0, fontFamily: 'Horta'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0),
                  child: Container(
                      height: 63.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                widget.icon,
                                size: 12.0,
                              ),
                              Text(': ${widget.weather.description}')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.wind,
                                size: 12.0,
                              ),
                              Text(': ${widget.weather.windSpeed} m/s'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.city, size: 12.0),
                              Text(
                                  ' : ${widget.weather.town}, ${widget.weather.country}'),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          )),
      SliverList(
        delegate: SliverChildListDelegate([
          Text('hour: ${widget.date.hour}'),
          Text('Some data')
        ]),
      )
    ]));
  }

  void choiceAction(String choice) {
    print(choice);
  }
}
