import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';

class MainText extends StatelessWidget {
  const MainText({
    Key? key,
    required this.textSize,
  }) : super(key: key);

  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hi,\nI'm Kartik Dhiman\nA Flutter Developer",
      style: TextStyle(
        fontSize: textSize,
        height: 1.5,
        fontWeight: FontWeight.bold,
        color: CustomColor.whitePrimary,
      ),
    );
  }
}
