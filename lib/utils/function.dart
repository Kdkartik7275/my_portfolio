import 'package:flutter/material.dart';

void scrollToSection(int navIndex, List navbarKeys) {
  // if (navIndex == 4) {
  //   // open a blog page
  //   js.context.callMethod('open', []);
  //   return;
  // }

  final key = navbarKeys[navIndex];
  Scrollable.ensureVisible(
    key.currentContext!,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
