import 'dart:convert';
import 'package:weather/api/api_key.dart';
import 'package:weather/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model.dart';

import '../model/watherdata2/watherdata2.dart';

class FetchWeatherApi {
  Future<Watherdata2> processDate(double lat, double lon) async {
    final String url = apiUrl(lat, lon);
    try {
      var response = await http.get(Uri.parse(url));
      print(response.body);
      // تحقق من أن الاستجابة ناجحة
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        return Watherdata2.fromJson(jsonString);
        // WeatherData weatherData =
        //     WeatherData(WeatherDataCurrent.fromJson(jsonString));

        // return weatherData;
      } else {
        // التعامل مع الحالات التي تكون فيها الاستجابة غير ناجحة
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      // التعامل مع أي استثناء قد يحدث
      print('Error fetching weather data: $e');
      throw Exception('Error fetching weather data');
    }
  }

  String apiUrl(double lat, double lon) {
    return "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";
  }
}
