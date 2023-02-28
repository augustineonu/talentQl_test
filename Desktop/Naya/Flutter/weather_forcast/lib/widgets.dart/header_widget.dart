import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String country = "";
  String date = DateFormat("EEE, d MMMM").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(
        globalController.latitude().value, globalController.longitude().value);

    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
      country = place.country!;
    });
    print(placemark[0].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$city,\n$country",
          style: const TextStyle(
              height: 1.6,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          date,
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
