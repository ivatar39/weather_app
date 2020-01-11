import 'package:flutter/material.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
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
                        '5 C❄',
                        style: TextStyle(
                            fontSize: 72,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Описание погоды. Нужно взять зонтик, не знаю',
                        style: TextStyle(
                            fontSize: 48,
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
