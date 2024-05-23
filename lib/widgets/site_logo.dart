import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    Key? key,
    this.onLogoTapped,
  }) : super(key: key);

  final Function()? onLogoTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLogoTapped,
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          "KD",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: CustomColor.yellowSecondary,
          ),
        ),
      ),
    );
  }
}
