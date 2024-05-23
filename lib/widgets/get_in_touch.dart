import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Get in touch",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: CustomColor.whitePrimary,
      ),
    );
  }
}
