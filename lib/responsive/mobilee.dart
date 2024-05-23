// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_portfoilio/utils/colors.dart';
import 'package:my_portfoilio/utils/function.dart';
import 'package:my_portfoilio/widgets/contact_section.dart';
import 'package:my_portfoilio/widgets/main_mobile.dart';
import 'package:my_portfoilio/widgets/mobile_drawer.dart';
import 'package:my_portfoilio/widgets/projects_section.dart';
import 'package:my_portfoilio/widgets/site_logo.dart';
import 'package:my_portfoilio/widgets/skills_mobile.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key});

  final ScrollController scrollController = ScrollController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: MobileDrawer(onNavItemTap: (int navIndex) {
        scaffoldKey.currentState?.closeEndDrawer();
        scrollToSection(navIndex, navbarKeys);
      }),
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // APP BAR
            MobileAppBar(
              scaffoldKey: scaffoldKey,
              key: navbarKeys.first,
            ),

            // MAIN

            MainMobile(onNavMenuTap: () {
              scrollToSection(3, navbarKeys);
            }),

            // SKILLS

            Container(
                key: navbarKeys[1],
                width: double.maxFinite,
                color: CustomColor.bgLight1,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                child: const SkillsMobile()),

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

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

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
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(Icons.menu),
            ),
          )
        ],
      ),
    );
  }
}
