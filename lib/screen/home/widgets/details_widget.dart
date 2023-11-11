// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';
import 'package:weatherapp/widgets/custom_text.dart';

class DetailsWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const DetailsWidget({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: CustomText(
            text: "Details",
            textSize: 20,
            fontWeight: kRegular,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailCard(
                detailTitle: "Humidity",
                detailIcon: "assets/icons/humidity-30.png",
                detailData: "${weatherDataCurrent.current.humidity!}%"),
            DetailCard(
                detailTitle: "WinSpeed",
                detailIcon: "assets/icons/wind-30.png",
                detailData: "${weatherDataCurrent.current.windSpeed!}mp/h"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailCard(
                detailTitle: "UV Index",
                detailIcon: "assets/icons/sun-30.png",
                detailData: "${weatherDataCurrent.current.uvi!}"),
            DetailCard(
                detailTitle: "Clouds",
                detailIcon: "assets/icons/clouds-30.png",
                detailData: "${weatherDataCurrent.current.clouds!}"),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DetailCard extends StatelessWidget {
  String detailTitle;
  String detailIcon;
  String detailData;
  DetailCard({
    Key? key,
    required this.detailTitle,
    required this.detailIcon,
    required this.detailData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 190,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white70,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(detailIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomText(text: detailData),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: detailTitle,
                  textColor: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
