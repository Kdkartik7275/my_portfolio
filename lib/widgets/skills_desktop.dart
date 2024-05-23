import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';
import 'package:my_portfoilio/utils/skills_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "What I can do",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 450,
                ),
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: [
                    for (int i = 0; i < platformItems.length; i++)
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          leading: Image.asset(
                            platformItems[i]["img"],
                            width: 26.0,
                          ),
                          title: Text(platformItems[i]["title"]),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      for (int i = 0; i < skillItems.length; i++)
                        Chip(
                          side: BorderSide.none,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          backgroundColor: CustomColor.bgLight2,
                          label: Text(skillItems[i]["title"]),
                          avatar: Image.asset(skillItems[i]["img"]),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
