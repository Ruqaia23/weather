import 'package:flutter/widgets.dart';
import 'package:weather/model/weather_model.dart';

import '../model/watherdata2/watherdata2.dart';

class CurrentWeather extends StatelessWidget {
  final Watherdata2? weatherDataCurrent;

  const CurrentWeather({
    super.key,
    required this.weatherDataCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${weatherDataCurrent?.wind?.speed ?? ""}'),
    );
  }
}
