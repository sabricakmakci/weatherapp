// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weatherapp/utils/constants/design_constants.dart';

class CustomText extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int? maxLine;
  final TextOverflow textOverflow;

  const CustomText({
    Key? key,
    required this.text,
    this.textColor = kBlackColor,
    this.textSize = kDefaultBodySize,
    this.fontWeight = kRegular,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.maxLine,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  TextWidgetState createState() => TextWidgetState();
}

class TextWidgetState extends State<CustomText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(
        widget.text,
        style: TextStyle(
            decoration: widget.textDecoration,
            color: widget.textColor,
            fontSize: widget.textSize,
            fontWeight: widget.fontWeight,
            overflow: widget.textOverflow),
        maxLines: widget.maxLine,
        textAlign: widget.textAlign,
        overflow: widget.textOverflow,
      );
}
