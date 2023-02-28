import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';
import '../model/weather_data_daily.dart';

class Next7Days extends StatelessWidget {
  
  Next7Days({super.key,required  this.weatherDataDaily,  });
final WeatherDataDaily weatherDataDaily;

  String getDay(final dayPeriod) {
    DateTime day = DateTime.fromMillisecondsSinceEpoch(dayPeriod * 1000);
    final x = DateFormat('EEEE').format(day);

    return x;
  }

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: Colors.grey,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Next 7 Days",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 40,
            ),
            ListView.builder(
              shrinkWrap: true,
              //padding: const EdgeInsets.only(left: 10, right: 10),
            
              scrollDirection: Axis.vertical,
                itemCount: weatherDataDaily.daily.length > 7
                    ? 7
                    : weatherDataDaily.daily.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getDay(weatherDataDaily.daily[index].dt),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Image.asset("assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png",
                  height: 35,
                  width: 35,),
                  const SizedBox(width: 20,),
                                const Text(
                                  "12",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
