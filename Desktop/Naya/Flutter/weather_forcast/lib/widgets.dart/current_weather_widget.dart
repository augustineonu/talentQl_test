import 'package:flutter/material.dart';

import '../model/wetaher_data_current.dart';



class WeatherDataWidget extends StatelessWidget {
   final WeatherDataCurrent weatherDataCurrent;
  
  const WeatherDataWidget({super.key, required this.weatherDataCurrent});


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
            children: [
              const Text(
                "Today",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  // Icon(
                  //   Icons.wb_sunny_outlined,
                  //   color: Colors.amber,
                  //   size: 52,
                  //   weight: 20,
                  // ),
                  Image.asset("assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
                  height: 35,
                  width: 35,),
                  const SizedBox(
                    width: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${weatherDataCurrent.current.temp!.toInt()}°",
                               style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                        ),
                      ]
                    )
                  ),
                 
                ],
              ),
              //SizedBox(height: 10.h,),
              Text(
                '${weatherDataCurrent.current.weather![0].description}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
    );
  }
}

