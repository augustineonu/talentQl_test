

import 'dart:convert';

import 'package:weather_forcast/model/wetaher_data_current.dart';


class WeatherDataHourly {

  final List<Hourly> hourly;

  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(hourly: List<Hourly>.from(json['hourly'].map((e)=> Hourly.fromJson(e))));
}


class Hourly {
  int? dt;
  int? temp;
  
  List<Weather>? weather;
  double? pop;
  Rain? rain;

  Hourly({
    this.dt,
    this.temp,
   
    this.weather,
    this.pop,
    this.rain,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        pop: (json['pop'] as num?)?.toDouble(),
        rain: json['rain'] == null
            ? null
            : Rain.fromJson(json['rain'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
      
        'weather': weather?.map((e) => e.toJson()).toList(),
        'pop': pop,
        'rain': rain?.toJson(),
      };
}



Rain rainFromJson(String str) => Rain.fromJson(json.decode(str));

String rainToJson(Rain data) => json.encode(data.toJson());

class Rain {
    Rain({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}
