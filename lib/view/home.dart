import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/view/current_weather.dart';
import 'package:weather/widget/Header.dart';

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
                        weatherDataCurrent: globalController.getWeatherData(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
