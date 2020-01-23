import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_repository.dart';
import 'package:flutter/cupertino.dart';

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
        appBar:AppBar(title: Text('Weathery'), backgroundColor: Colors.green, actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction ,
            itemBuilder: (BuildContext context){
              return Constants.more.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],) ,
        body: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(
          children: <Widget>[
            Text('${(widget.weather.temperature - 273.15).toInt()}°C', style: TextStyle(fontSize: 57),),
          ],
      ),
        )
    );
  }
  void choiceAction(String choice){
      print(choice);
  }
}
