import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:weatherapp/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
      title: "Weather",
      debugShowCheckedModeBanner: false,
    );
  }
}
