import 'package:weather_app/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  Future<Weather> getWeather(num lat, num lon) async {
    final response = await http
        .get('api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon');
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Weather.fromJson(response.body);
    } else {}
  }
}
