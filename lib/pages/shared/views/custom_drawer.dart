import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:course_management/course_management.dart';
import 'package:taav_ui/taav_ui.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const TaavText(
                'نمایش دروس',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(CourseManagementRouteNames.courseListPage);
              },
            ),
            ListTile(
              title: const TaavText(
                'افزودن دانش آموز',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(CourseManagementRouteNames.addStudentPage);
              },
            ),
            ListTile(
              title: const TaavText(
                'تغییر دانش آموز',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(CourseManagementRouteNames.editStudentPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
