import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: kBlurryColor,
    );
  }
}
