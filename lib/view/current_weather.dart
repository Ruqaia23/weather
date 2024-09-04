import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/model/watherdata2/weather.dart';
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
    return Column(
      children: [
        tempeathureAreaWidget(weatherDataCurrent),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }
}

currentWeatherMoreDetailsWidget() {
  return Container();
}

Widget tempeathureAreaWidget(dynamic weatherDataCurrent) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset(
        'assets/icons/50d.png',
        height: 80,
        width: 80,
      ),
      Container(
        height: 50,
        width: 1,
        color: Colors.grey,
      ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: '${weatherDataCurrent.weather[0].description}°',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          ],
        ),
      )
    ],
  );
}
