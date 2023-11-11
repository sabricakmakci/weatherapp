import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late LocationHelper locationData;
  // Future<void> getLocationData() async {
  //   locationData = LocationHelper();
  //   await locationData.getCurrentLocation();
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [kAppColor, kAppColor, kBlueColor100],
      )),
      child: const Center(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'sabr;',
              style: TextStyle(color: kWhiteColor),
            )
          ],
        ),
      ),
    );
  }
}
