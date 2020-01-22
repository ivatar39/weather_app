import 'package:weather_app/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  Weather loadedWeather;

  Future<void> getWeather(num lat, num lon) async {
    /* final response = */ await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon',
        headers: {'x-api-key': '1539a383d823965800c50ec8b158a02f'}).then((v) {
      if (v.statusCode >= 200 && v.statusCode < 300) {
        print(v.body);
        print(v.statusCode);
        loadedWeather = Weather.fromJson(v.body);
      } else {
        return null;
      }
    }).catchError((error) {
      print(error);
      print(14);
      return null;
    });
  }
}
