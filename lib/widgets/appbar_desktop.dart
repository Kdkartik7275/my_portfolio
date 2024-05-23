import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';
import 'package:my_portfoilio/utils/nav_items.dart';
import 'package:my_portfoilio/widgets/site_logo.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.transparent,
            CustomColor.bgLight1,
          ]),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          const SiteLogo(),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                  onPressed: () {
                    onNavMenuTap(i);
                  },
                  child: Text(navTitles[i])),
            )
        ],
      ),
    );
  }
}
