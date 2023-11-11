// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';

const double kBlur = 1.0;
const EdgeInsetsGeometry kDefaultPadding = EdgeInsets.all(16);
const Color kDefaultColor = Colors.transparent;
const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(20));
const double kColorOpacity = 0.2;

class BlurryContainer extends StatelessWidget {
  final Widget? child;
  final double blur;
  final double? height, width;
  final EdgeInsetsGeometry padding;
  final Color bgColor;
  final Color? borderColor;
  final BorderRadius borderRadius;
  final double borderWidth;
  final double? constrainWidth;
  final double colorOpacity;

  const BlurryContainer({
    Key? key,
    this.child,
    this.blur = 5,
    this.height,
    this.width,
    this.padding = kDefaultPadding,
    this.bgColor = kDefaultColor,
    this.borderColor,
    this.borderRadius = kBorderRadius,
    this.borderWidth = .7,
    this.constrainWidth,
    this.colorOpacity = kColorOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: borderWidth > 0 ? borderRadius : BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            constraints: BoxConstraints(
              maxWidth: constrainWidth ?? double.infinity,
            ),
            decoration: borderWidth > 0
                ? BoxDecoration(
                    borderRadius: borderWidth > 0 ? borderRadius : null,
                    color: bgColor == Colors.transparent ? bgColor : bgColor.withOpacity(colorOpacity),
                    border: Border.all(color: borderColor ?? kWhiteColor, width: borderWidth),
                  )
                : const BoxDecoration(),
            padding: padding,
            child: child,
          ),
        ),
      );
}
