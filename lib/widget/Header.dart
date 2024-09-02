import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/model/weather_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';

  //عشان يظهر الوقت الحالي في الشاشه ولازم نحط بك intl
  String date = DateFormat('yMMMd').format(DateTime.now());

  //استدعاء الكنترولر الموجود في ملف الcontroller
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.bottomLeft,
          child: Text(
            city,
            // weatherModle.name!,
            style: TextStyle(fontSize: 35, height: 2),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.bottomLeft,
          child: Text(
            date,
            style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1),
          ),
        )
      ],
    );
  }
}
