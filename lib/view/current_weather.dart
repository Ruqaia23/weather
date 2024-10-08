import 'package:flutter/material.dart';
import 'package:weather/model/weather_current.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent? weatherDataCurrent;

  const CurrentWeather({
    super.key,
    required this.weatherDataCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempeathureAreaWidget(weatherDataCurrent, 'clearSky'),
        SizedBox(
          height: 20,
        ),
        currentWeatherMoreDetailsWidget(weatherDataCurrent),
      ],
    );
  }
}

currentWeatherMoreDetailsWidget(weatherDataCurrent) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color.fromARGB(153, 230, 227, 227),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset('assets/icons/windsspeed.png',
              color: const Color.fromRGBO(83, 171, 223, 1)),
        ),
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color.fromARGB(153, 230, 227, 227),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset('assets/icons/03d.png',
              color: const Color.fromRGBO(83, 171, 223, 1)),
        ),
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color.fromARGB(153, 230, 227, 227),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset('assets/icons/humidity.png',
              color: const Color.fromRGBO(83, 171, 223, 1)),
        ),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 20,
          width: 60,
          child: Text(
            '${weatherDataCurrent.current.windSpeed}Km/h',
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
          width: 60,
          child: Text(
            '${weatherDataCurrent.current.clouds}%',
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
          width: 60,
          child: Text(
            '${weatherDataCurrent.current.humidity}%',
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  ]);
}

Widget tempeathureAreaWidget(weatherDataCurrent, String weatherIcon) {
  //final String weatherIcon;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        //margin: EdgeInsets.all(5),
        child: Image.asset(
          'assets/icons/$weatherIcon.png',
          height: 80,
          width: 80,
        ),
      ),
      Container(height: 50, width: 1, color: Colors.black
          //Colors.grey,
          ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: '${weatherDataCurrent.current.temp.toInt()}°',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 50,
                )),
            TextSpan(
                text: '${weatherDataCurrent.current.weather[0].description}',
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
