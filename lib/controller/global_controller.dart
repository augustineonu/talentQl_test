import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../api/fetch_weather.dart';
import '../model/weather_data.dart';


class GlobalController extends GetxController {
  //variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  //their instances
  RxBool checkLoadin() => _isLoading;
  RxDouble latitude() => _latitude;
  RxDouble longitude() => _longitude;

  final weatherData = WeatherData().obs;
  
   getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    //status of permission request
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //request a new permission
      locationPermission == Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        return Future.error("Location permission is denied");
      }
    }

    //get current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      //call weather api

      return FetchWeather()
          .getWeatherData(_latitude.value, _longitude.value)
          .then((value) {
            weatherData.value = value;
        _isLoading.value = false;

      });
    });
  }
}
