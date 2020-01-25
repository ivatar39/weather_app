import 'dart:convert';

class Weather {
  String town;
  String main;
  String description;
  num temperature;
  num windSpeed;
  String country;
  int id;
  num maxTemp;
  num minTemp;
  num humidity;
  num pressure;
  num feels;

  Weather(
      {this.town,
      this.description,
      this.main,
      this.temperature,
      this.windSpeed,
      this.country,
      this.id,
      this.maxTemp,
      this.minTemp,
      this.humidity,
      this.pressure,
      this.feels});

  static Weather fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    return Weather(
        town: data['name'],
        description:
            '${data['weather'][0]['description'][0].toUpperCase()}${data['weather'][0]['description'].substring(1)}',
        main: data['weather'][0]['main'],
        temperature: data['main']['temp'],
        windSpeed: data['wind']['speed'],
        country: data['sys']['country'],
        maxTemp: data['main']['temp_max'],
        minTemp: data['main']['temp_min'],
        humidity: data['main']['humidity'],
        pressure: data['main']['pressure'],
        id: data['weather'][0]['id'],
        feels: data['main']['feels_like']);
  }
}
