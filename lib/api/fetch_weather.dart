import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/weather_data.dart';
import '../model/weather_data_daily.dart';
import '../model/weather_data_hourly.dart';
import '../model/wetaher_data_current.dart';
import '../utils/constant/api_key.dart';


class FetchWeather {
  WeatherData? weatherData;

  Future<WeatherData> getWeatherData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);

    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }

  String apiURL(lat, lon) {
    String url;
    url =
        "http://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minute&appid=$apiKey&units=metric";
    return url;
  }
}
