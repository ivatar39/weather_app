import 'dart:convert';

class Weather {
  String town;
  String main;
  String description;
  num temperature;
  num windSpeed;

  Weather(
      {this.town,
      this.description,
      this.main,
      this.temperature,
      this.windSpeed});

  static Weather fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    print(data);
    print(data['name']);
    print(data['weather'][0]['description']);
    print(data['weather'][0]['main']);
    print(data['main']['temp'] - 273);
    print(data['wind']['speed']);
    return Weather(
        town: data['name'],
        description: data['weather'][0]['description'],
        main: data['weather'][0]['main'],
        temperature: data['main']['temp'],
        windSpeed: data['wind']['speed']);
  }

  @override
  String toString() {
    return '$main $temperature $description $town $windSpeed';
  }
}
