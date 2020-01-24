import 'dart:convert';

class Weather {
  String town;
  String main;
  String description;
  num temperature;
  num windSpeed;
  String country;

  Weather(
      {this.town,
      this.description,
      this.main,
      this.temperature,
      this.windSpeed,
      this.country});

  static Weather fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    return Weather(
        town: data['name'],
        description:'${data['weather'][0]['description'][0].toUpperCase()}${data['weather'][0]['description'].substring(1)}',
        main: data['weather'][0]['main'],
        temperature: data['main']['temp'],
        windSpeed: data['wind']['speed'],
    country: data['sys']['country']);
  }
}
