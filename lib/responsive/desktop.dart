import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/function.dart';

import 'package:my_portfoilio/widgets/appbar_desktop.dart';
import 'package:my_portfoilio/widgets/contact_section.dart';
import 'package:my_portfoilio/widgets/main_desktop.dart';
import 'package:my_portfoilio/widgets/projects_section.dart';
import 'package:my_portfoilio/widgets/skills_desktop.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key});

  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(key: navbarKeys.first),
            // APP BAR
            DesktopAppBar(onNavMenuTap: (int navIndex) {
              scrollToSection(navIndex, navbarKeys);
            }),

            // MAIN

            MainDesktop(onNavMenuTap: () {
              scrollToSection(3, navbarKeys);
            }),

            // SKILLS

            SkillsDesktop(key: navbarKeys[1]),

            // PROJECTS

            ProjectsSection(key: navbarKeys[2]),

            // CONTACT

            ContactSection(key: navbarKeys[3]),
          ],
        ),
      ),
    );
  }
}
