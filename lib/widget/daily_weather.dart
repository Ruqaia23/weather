import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_daily.dart';

class DailyWeather extends StatelessWidget {
  final WeatherDataDaily? weatherDataDaily;
  const DailyWeather({super.key, this.weatherDataDaily});

  //string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topLeft,
          child: const Text(
            'Next Day',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 400,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color.fromARGB(153, 230, 227, 227),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              daysList(),
            ],
          ),
        ),
      ],
    );
  }

  daysList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily!.daily.length > 7
            ? 7
            : weatherDataDaily!.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        getDay(weatherDataDaily!.daily[index].dt),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: Image.asset(
                          'assets/icons/${weatherDataDaily!.daily[index].weather![0].icon}.png'),
                    ),
                    Text(
                        '${weatherDataDaily!.daily[index].temp!.max}°  /   ${weatherDataDaily!.daily[index].temp!.min}°')
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: const Color.fromARGB(105, 83, 172, 223),
              )
            ],
          );
        },
      ),
    );
  }
}
