// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:weather/model/weather_current.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            'Comfort Level',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                  child: SleekCircularSlider(
                min: 0,
                max: 50,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        bottomLabelText: 'Humidity',
                        bottomLabelStyle: TextStyle(
                            letterSpacing: 0.1, fontSize: 14, height: 2.5)),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        trackColor:
                            Color.fromARGB(255, 81, 166, 246).withAlpha(100),
                        progressBarColors: [
                          const Color.fromARGB(255, 128, 193, 255),
                          const Color.fromARGB(255, 81, 166, 246)
                        ])),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
