// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/model/weather_data_daily.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';
import 'package:weatherapp/widgets/custom_text.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({
    Key? key,
    required this.weatherDataDaily,
  }) : super(key: key);

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 450,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white70,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: const CustomText(
                text: "7 Days Forecast",
                textSize: 17,
                fontWeight: FontWeight.w200,
              ),
            ),
            dailyList(),
          ],
        ),
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: weatherDataDaily.daily.length > 7 ? 7 : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      child: CustomText(text: getDay(weatherDataDaily.daily[index].dt)),
                    ),
                    const SizedBox(width: 90),
                    Container(
                      child: Row(
                        children: [
                          CustomText(
                            text: "${weatherDataDaily.daily[index].temp!.max}",
                            textColor: Colors.red,
                          ),
                          CustomText(
                            text: "${weatherDataDaily.daily[index].temp!.min}",
                            textColor: kAppColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 80),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/icons/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: const Color.fromARGB(255, 234, 234, 234),
              )
            ],
          );
        },
      ),
    );
  }
}
