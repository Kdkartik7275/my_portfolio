// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';

import 'package:my_portfoilio/utils/project_items.dart';
import 'package:my_portfoilio/widgets/technologies.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    Key? key,
    required this.project,
  }) : super(key: key);

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ProjectDialog(context);
      },
      child: Container(
        height: 290,
        width: 260,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.bgLight2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              child: Image.asset(
                project.images.first,
                height: 140,
                width: 260,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                project.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                project.desciption,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColor.whiteSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> ProjectDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return LayoutBuilder(builder: (context, constraints) {
            bool isMobile = constraints.maxWidth <= 700;
            return Dialog(
              backgroundColor: Colors.white,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile ? 400 : 600),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                  // width: screenWidth / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: isMobile
                      ? ListView(
                          children: [
                            Text(
                              project.title,
                              style: const TextStyle(
                                  color: CustomColor.scaffoldBg,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              project.desciption,
                              style: const TextStyle(
                                  color: CustomColor.hintDark, fontSize: 14),
                            ),
                            for (int i = 0; i < project.images.length; i++)
                              SizedBox(
                                child: Image.asset(
                                  project.images[i],
                                  // height: 250,
                                  // width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(height: 20),
                            ProjectTechnologies(project: project)
                          ],
                        )
                      : DesktopDialogWidget(project: project),
                ),
              ),
            );
          });
        });
  }
}

class DesktopDialogWidget extends StatelessWidget {
  const DesktopDialogWidget({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: ListView(
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                      color: CustomColor.scaffoldBg,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Text(
                  project.desciption,
                  style: const TextStyle(
                      color: CustomColor.hintDark, fontSize: 14),
                ),
                const SizedBox(height: 20),
                ProjectTechnologies(project: project)
              ],
            )),
        SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < project.images.length; i++)
                Container(
                  height: 300,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Image.asset(
                    project.images[i],
                    height: 250,
                    width: 200,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
