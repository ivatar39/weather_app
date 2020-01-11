import 'package:flutter/material.dart';

void main() => runApp(MyApp());
String url =
    'https://s7d2.scene7.com/is/image/TWCNews/0801_n13_chuluotaweatherjpg?wid=2000&hei=1125&\$wide-bg\$';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kali-Weather",
      home: Scaffold(
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '5 C❄',
                  style: TextStyle(
                      fontSize: 72,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Описание погоды. Нужно взять зонтик, не знаю',
                    style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
