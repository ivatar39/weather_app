import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Error!',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
            Text(
              'What to do:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '1. Check your internet connection',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '2. Check that you are not located in Siberia',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'And then try again:',
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/loading');
              },
            ),
          ],
        ),
      ),
    );
  }
}
