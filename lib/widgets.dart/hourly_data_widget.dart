import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/weather_data_hourly.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyDataWidget({super.key, required this.weatherDataHourly});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff74A1FF),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return HourlyDetails(timeStamp: weatherDataHourly.hourly[index].dt!,
           temp: weatherDataHourly.hourly[index].temp!.toInt(), 
           weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,);
        },
        itemCount: weatherDataHourly.hourly.length > 12 ? 12 : weatherDataHourly.hourly.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
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
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 500);
    String x = DateFormat('j').format(time);

    return x;
  }
  const HourlyDetails({
    super.key, required this.temp, required this.timeStamp, required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      height: 95,
      width: 47,
      decoration: const BoxDecoration(
          color: Colors.blue,
          //color: AppColors.primaryColor2,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          Text(
            getTime(timeStamp),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w400),
          ),
          //   Icon(
          //   Icons(weatherIcon)
          //   //Icons.cloudy_snowing,
          //   //color: Colors.white,
          // ),
          Image.asset("assets/weather/$weatherIcon.png",
                  height: 22,
                  width: 22,),
          Text(
            '${temp.toString()}°',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
