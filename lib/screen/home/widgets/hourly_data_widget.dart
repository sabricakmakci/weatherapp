// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather_data_hourly.dart';
import 'package:weatherapp/widgets/blurry_container.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyDataWidget({
    Key? key,
    required this.weatherDataHourly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlurryContainer(
        padding: const EdgeInsets.all(5),
        height: 150,
        colorOpacity: 0.8,
        bgColor: Colors.white70,
        borderColor: Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length > 12 ? 20 : weatherDataHourly.hourly.length,
          itemBuilder: (context, index) {
            return HourlyDetails(
              temp: weatherDataHourly.hourly[index].temp!,
              timeStamp: weatherDataHourly.hourly[index].dt!,
              weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMicrosecondsSinceEpoch(timeStamp * 1000000);
    String x = DateFormat('H').format(time);
    return x;
  }

  HourlyDetails({
    Key? key,
    required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp)),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Image.asset(
            "assets/icons/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("$temp°"),
        )
      ],
    );
  }
}
