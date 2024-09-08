import 'package:weather/model/weather_current.dart';
import 'package:weather/model/weather_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;

  WeatherData([this.hourly, this.current]);

  //function to get the values

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
}
