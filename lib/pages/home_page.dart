import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_icons/weather_icons.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  final Weather weather;
  var date = DateTime.now();
  String weekday;
  IconData wicon = WeatherIcons.day_thunderstorm;

  HomePage({Key key, this.weather}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print('init');

    if (widget.weather.id == 801) {
      if ((widget.date.hour >= 20 && widget.date.hour <= 23) ||
          (widget.date.hour >= 0 && widget.date.hour <= 9)) {
        widget.wicon = FontAwesomeIcons.cloudMoon;
      } else
        widget.wicon = FontAwesomeIcons.cloudSun;
    }
    if (widget.weather.id > 801) {
      widget.wicon = FontAwesomeIcons.cloud;
    }
    if (widget.weather.id >= 700 && widget.weather.id < 800) {
      widget.wicon = FontAwesomeIcons.smog;
    }
    if (widget.weather.id >= 600 && widget.weather.id < 700) {
      widget.wicon = FontAwesomeIcons.snowflake;
    }
    if (widget.weather.id >= 500 && widget.weather.id < 600) {
      widget.wicon = FontAwesomeIcons.cloudRain;
    }
    if (widget.weather.id >= 300 && widget.weather.id < 400) {
      if ((widget.date.hour >= 20 && widget.date.hour <= 23) ||
          (widget.date.hour >= 0 && widget.date.hour <= 9)) {
        widget.wicon = FontAwesomeIcons.cloudMoonRain;
      } else
        widget.wicon = FontAwesomeIcons.cloudSunRain; //Привет Самирка
    }
    if (widget.weather.id >= 200 && widget.weather.id <= 299) {
      if ((widget.date.hour >= 20 && widget.date.hour <= 23) ||
          (widget.date.hour >= 0 && widget.date.hour <= 9)) {
        widget.wicon = WeatherIcons.night_thunderstorm;
      } else
        widget.wicon = WeatherIcons.day_thunderstorm; //Как дела?
    }
    if (widget.weather.id == 800) {
      if ((widget.date.hour >= 20 && widget.date.hour <= 23) ||
          (widget.date.hour >= 0 && widget.date.hour <= 9)) {
        widget.wicon = FontAwesomeIcons.moon;
      } else
        widget.wicon = FontAwesomeIcons.sun;
    }

    if ((widget.weather.temperature - 273.15).toInt() >= 20 && //Д/З сделал уже?
        widget.weather.id == 800) {
      widget.wicon = FontAwesomeIcons.fire; //А то кодит он...
    }
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
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                        child:
                            Icon(widget.wicon, size: 70.0, color: Colors.white),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, right: 90.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Text(
                            '${(widget.weather.temperature - 273.15).toInt()}°C',
                            style: TextStyle(
                                fontSize: 100.0,
                                fontFamily: 'Horta',
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 20.0),
                    child: Container(
                        height: 63.0,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.cloud,
                                    size: 12.0, color: Colors.white),
                                Text(
                                  ' : ${widget.weather.description}',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.wind,
                                    size: 12.0, color: Colors.white),
                                Text(
                                  ': ${widget.weather.windSpeed} m/s',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.city,
                                    size: 12.0, color: Colors.white),
                                Text(
                                  ' : ${widget.weather.town}, ${widget.weather.country}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          )),
      SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.thermometerEmpty,
                  color: Colors.grey,
                ),
                Center(
                    child: Text(
                        'RealFeel° ${(widget.weather.feels - 273.15).toInt()}°C')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.snowflake,
                  color: Colors.cyanAccent,
                ),
                Center(
                    child: Text(
                        'Min temperature: ${(widget.weather.minTemp - 273.15).toInt()}°C')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.fire,
                  color: Colors.deepOrange,
                ),
                Center(
                    child: Text(
                        'Max temperature: ${(widget.weather.maxTemp - 273.15).toInt()}°C')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.tint,
                  color: Colors.indigo,
                ),
                Center(child: Text('Humidity: ${widget.weather.humidity}%')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Icon(
                    WeatherIcons.barometer,
                    color: Colors.indigo,
                  ),
                ),
                Center(
                    child: Text(
                        'Pressure: ${(widget.weather.pressure * 0.0075).toString()[0]}.${(widget.weather.pressure * 0.0075).toString()[2]}mmHg')),
              ],
            ),
          )
        ]),
      )
    ]));
  }

  void choiceAction(String choice) {
    switch (choice) {
      case 'Информация':
        showDialog(
          context: context,
          // ignore: missing_return
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Weathery v1.0.0'),
              content: Container( height: 280.0,
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:41.0),
                    child: Image.asset('assets/info.png',width: 150, height: 150,),
                  ),
                  Text('Developed by: Lavakalas(Ilya)\n'
                      'Contact information: lavakalas@mail.ru')
                ],),
              ),
            );
          }
        );
        break;

      case'Выход':
        SystemNavigator.pop();
        break;
    }
  }
}
