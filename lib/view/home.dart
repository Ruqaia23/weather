import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/view/current_weather.dart';
import 'package:weather/widget/Header.dart';
import 'package:weather/widget/comfort_level.dart';
import 'package:weather/widget/daily_weather.dart';
import 'package:weather/widget/hourly_weather.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(165, 175, 235, 1),
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),

                      //current temp
                      CurrentWeather(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HourlyData(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getHourlyWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DailyWeather(
                          weatherDataDaily: globalController
                              .getWeatherData()
                              .getDailyWeather()),
                      Container(
                        height: 1,
                        color: const Color.fromARGB(105, 83, 172, 223),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ComfortLevel(
                          weatherDataCurrent: globalController
                              .getWeatherData()
                              .getCurrentWeather())
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
