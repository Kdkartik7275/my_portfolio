import 'package:flutter/material.dart';
import 'package:my_portfoilio/responsive/desktop.dart';
import 'package:my_portfoilio/responsive/mobilee.dart';
import 'package:my_portfoilio/responsive/responsive_layyout.dart';
import 'package:my_portfoilio/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kCustomTheme,
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
          mobileLayout: MobileLayout(), dektopLayout: DesktopLayout()),
    );
  }
}
