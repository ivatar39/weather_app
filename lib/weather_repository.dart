import 'package:weather_app/weather.dart';
import 'package:http/http.dart' as http;

class weatherRepository {
  Weather decodedData;
  Future<void> getWeather(num lat, num lon) async {
    final response = await http
        .get('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=274adfcb3e8e8b2922e14a294a0a587d');
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      print(response.statusCode);
      decodedData = Weather.fromJson(response.body);
    } else {
      return null;
    }
  }
}
