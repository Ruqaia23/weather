import 'package:weather/model/weather_current.dart';
import 'package:weather/model/weather_daily.dart';
import 'package:weather/model/weather_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.hourly, this.current, this.daily]);

  //function to get the values

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}
