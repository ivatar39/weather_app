import 'dart:convert';

class Weather {
  var town, country, main, description;
  var temperature, windSpeed, humidity, pressure, cloudiness;

  Weather(
      {this.country,
      this.town,
      this.main,
      this.description,
      this.temperature,
      this.windSpeed,
      this.humidity,
      this.pressure,
      this.cloudiness});

  static Weather fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);

    print(Weather(
        country: data['sys']['country'],
        town: data['name'],
        description: data['weather'][0]['description'],
        main: data['weather'][0]['main'],
        temperature: data['main']['temp'],
        windSpeed: data['wind']['speed'],
        humidity: data['main']['humidity'],
        pressure: data['main']['pressure'],
        cloudiness: data['clouds']));

    return Weather(
        country: data['sys']['country'],
        town: data['name'],
        description: data['weather'][0]['description'],
        main: data['weather'][0]['main'],
        temperature: data['main']['temp'],
        windSpeed: data['wind']['speed'],
        humidity: data['main']['humidity'],
        pressure: data['main']['pressure'],
        cloudiness: data['clouds']);
  }
}
