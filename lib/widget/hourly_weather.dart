import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';

import 'package:weather/model/weather_hourly.dart';

class HourlyData extends StatelessWidget {
  final WeatherDataHourly? weatherDataHourly;

  HourlyData({super.key, this.weatherDataHourly});

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text(
            'Today',
            style: TextStyle(fontSize: 18),
          ),
        ),
        hourlyList(),
      ],
    );
  }

//عرض الطقس بساعات اليوم
  hourlyList() {
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly!.hourly.length > 12
            ? 24
            : weatherDataHourly!.hourly.length,
        itemBuilder: (context, index) {
          return Obx((() => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: EdgeInsets.only(left: 20, right: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                        color: const Color.fromARGB(153, 230, 227, 227),
                      ),
                    ],
                    gradient: cardIndex.value == index
                        ? LinearGradient(colors: [
                            Color.fromARGB(255, 128, 193, 255),
                            Color.fromARGB(255, 81, 166, 246),
                          ])
                        : null),
                child: HourlyDetails(
                  temp: weatherDataHourly!.hourly[index].temp!,
                  timeStamp: weatherDataHourly!.hourly[index].dt!,
                  weatherIcon:
                      weatherDataHourly!.hourly[index].weather![0].icon!,
                ),
              ))));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int temp;
  final int timeStamp;
  final String weatherIcon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  HourlyDetails({
    Key? key,
    required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
  }) : super(key: key);

  RxInt cardIndix = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp)),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Image.asset(
            'assets/icons/$weatherIcon.png',
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text('$temp°'),
        )
      ],
    );
  }
}
