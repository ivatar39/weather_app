import 'package:flutter/material.dart';

class GeoPage extends StatefulWidget {
  @override
  _GeoPageState createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text('Turn on Geolocation adn restart the application'),
    );
  }
}
