import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/screen/home/widgets/daily_data_forecast.dart';
import 'package:weatherapp/screen/home/widgets/header_widget.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';
import 'package:weatherapp/utils/device/device_utils.dart';
import 'package:weatherapp/widgets/custom_appbar.dart';
import 'package:weatherapp/widgets/custom_drawer.dart';
import 'widgets/details_widget.dart';
import 'widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(() => globalController.checkLoading().isTrue
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            drawer: const CustomDrawer(),
            appBar: const CustomAppBar(),
            backgroundColor: kAppColor,
            body: Stack(
              children: [
                Positioned(
                  height: DeviceUtils.getHeight(context),
                  width: DeviceUtils.getWidth(context),
                  child: const Column(
                    children: [
                      // Container(
                      //   height: (DeviceUtils.getHeight(context) * .35),
                      //   width: DeviceUtils.getWidth(context),
                      //   decoration: const BoxDecoration(
                      //       gradient: LinearGradient(
                      //         begin: Alignment.topCenter,
                      //         end: Alignment.bottomCenter,
                      //         colors: [kAppColor, kBlueColor100],
                      //       ),
                      //       borderRadius: BorderRadius.only(
                      //         bottomLeft: Radius.circular(30),
                      //         bottomRight: Radius.circular(30),
                      //       )),
                      // ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Positioned(
                    height: DeviceUtils.getHeight(context),
                    width: DeviceUtils.getWidth(context),
                    child: Column(
                      children: [
                        HeaderWidget(
                          weatherDataCurrent: globalController.getWeatherData().getCurrentWeather(),
                        ),
                        const SizedBox(height: 40),
                        HourlyDataWidget(
                          weatherDataHourly: globalController.getWeatherData().getHourlyWeather(),
                        ),
                        const SizedBox(height: 20),
                        DailyDataForecast(
                          weatherDataDaily: globalController.getWeatherData().getDailyWeather(),
                        ),
                        const SizedBox(height: 20),
                        DetailsWidget(
                          weatherDataCurrent: globalController.getWeatherData().getCurrentWeather(),
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
  }
}
