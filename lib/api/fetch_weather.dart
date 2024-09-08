import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_current.dart';
import 'package:weather/model/weather_data.dart';
import 'package:weather/model/weather_hourly.dart';
import 'package:weather/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  // procecssing the data from response -> to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
    );

    return weatherData!;
  }
}


// class FetchWeatherApi {
//   Future<Watherdata2> processDate(double lat, double lon) async {
//     final String url = apiUrl(lat, lon);
//     try {
//       var response = await http.get(Uri.parse(url));
//       print(response.body);

//       // تحقق من أن الاستجابة ناجحة
//       if (response.statusCode == 200) {
//         var jsonString = jsonDecode(response.body);
//         Watherdata2 weatherData =
//             (WeatherDataCurrent.fromJson(jsonString));
//         //return Watherdata2.fromJson(jsonString);

//           return weatherData;
//       } else {
//         // التعامل مع الحالات التي تكون فيها الاستجابة غير ناجحة
//         throw Exception('Failed to load weather data: ${response.statusCode}');
//       }
//     } catch (e) {
//       // التعامل مع أي استثناء قد يحدث
//       print('Error fetching weather data: $e');
//       throw Exception('Error fetching weather data');
//     }
//   }

//   String apiUrl(double lat, double lon) {
//     return "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=current،hourly,daily&appid=$apiKey&units=metric&exclude=minutely";
//   }
// }


