import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kAppColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        50,
      );
}
