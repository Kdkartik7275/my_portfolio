import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';
import 'package:my_portfoilio/utils/project_items.dart';

class ProjectTechnologies extends StatelessWidget {
  const ProjectTechnologies({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Technologies Used:",
          style: TextStyle(color: CustomColor.hintDark, fontSize: 18),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < project.technologiesUsed.length; i++)
                Chip(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 16.0,
                    ),
                    backgroundColor: CustomColor.bgLight2,
                    label: Text(
                      project.technologiesUsed[i],
                      style: const TextStyle(fontSize: 12),
                    )),
            ],
          ),
        )
      ],
    );
  }
}
