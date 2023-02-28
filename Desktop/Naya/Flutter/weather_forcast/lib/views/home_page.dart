import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_forcast/utils/colors.dart';

import '../controller/global_controller.dart';
import '../widgets.dart/current_weather_widget.dart';
import '../widgets.dart/header_widget.dart';
import '../widgets.dart/hourly_data_widget.dart';
import 'next_7_days.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.tr,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor2,
                    AppColors.primaryColor2,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(Icons.menu_rounded),
            )
          ],
        ),
        body: SafeArea(
          child: Obx(
            () => globalController.checkLoadin().isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColor2,
                            Color(0xFF729DFD),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 0, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeaderWidget(),
                          WeatherDataWidget(
                            weatherDataCurrent:
                                globalController.getData().getCurrentWeather(),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Today',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Tomorrow',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.3),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to( Next7Days( weatherDataDaily:
                          globalController.getData().getDailyWeather(),));
                                            //context.push('/next7Days');
                                          },
                                          child: Text(
                                            'Next 7 Days',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white.withOpacity(0.3),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              HourlyDataWidget(
                                  weatherDataHourly: globalController
                                      .getData()
                                      .getHourlyWeather()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }
}
