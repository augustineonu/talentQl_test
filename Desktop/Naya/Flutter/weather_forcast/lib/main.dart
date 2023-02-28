import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_forcast/routes/app_route.dart';
import 'package:weather_forcast/views/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
      return 
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
    return GetMaterialApp(
      home: HomeScreen(),
       
      debugShowCheckedModeBanner: false,
      title: 'Weather Forcast',
       initialRoute: '/home',
      getPages: appRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  });}
}

