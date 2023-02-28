import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/weather_data_daily.dart';

class DailyDataForcast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  
  const DailyDataForcast({super.key, required this.weatherDataDaily});

  @override
  Widget build(BuildContext context) {
    return  dailyList();
  }

  Widget dailyList() {
    return Container(

  );
  }
}