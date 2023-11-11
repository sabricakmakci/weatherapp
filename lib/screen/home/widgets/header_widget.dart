// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/widgets/custom_text.dart';

import '../../../controller/global_controller.dart';
import '../../../utils/constants/design_constants.dart';

// ignore: must_be_immutable

class HeaderWidget extends StatefulWidget {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  final WeatherDataCurrent weatherDataCurrent;
  HeaderWidget({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String date = DateFormat("EEEE, d MMM yyyy").format(DateTime.now());
  String city = "";

  @override
  void initState() {
    getAddress(
      widget.globalController.getLattitude().value,
      widget.globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = "${place.locality!},${place.country!}";
    });
  }

  @override
  Widget build(BuildContext context) {
    String weatherDescription = widget.weatherDataCurrent.current.weather![0].description!;
    String capitalizedDescription = capitalizeEachWord(weatherDescription);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        CustomText(
          text: city,
          textColor: kWhiteColor,
          fontWeight: kSemiBold,
          textSize: 18,
        ),
        const SizedBox(height: 20),
        CustomText(
          text: "${widget.weatherDataCurrent.current.temp}°",
          textColor: kWhiteColor,
          textSize: 60,
          fontWeight: kSemiBold,
        ),
        const SizedBox(height: 10),
        CustomText(
          text: capitalizedDescription,
          textColor: kWhiteColor,
          textSize: 20,
          fontWeight: kBold,
        ),
        CustomText(
          text: date,
          textColor: kWhiteColor,
          textSize: 16,
          fontWeight: kRegular,
        )
      ],
    );
  }
}

String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}

String capitalizeEachWord(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text.split(' ').map((word) => capitalize(word)).join(' ');
}
