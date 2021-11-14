import 'package:flutter/material.dart';
import 'package:driver_app/pages/utils/style.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  // ignore: use_key_in_widget_constructors
  const CustomText({@required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? StyleApp.black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
