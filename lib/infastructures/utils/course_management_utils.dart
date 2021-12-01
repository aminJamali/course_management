import 'package:flutter/material.dart';

class CourseManagementUtils {
  static double largePadding() => 10;

  static double mediumPadding() => 5;

  static double smallPadding() => 3;

  static double tinyPadding() => 2;

  static double textFormFiledHeight() => 45;
  static dividerSizedBox() {
    return SizedBox(
      height: CourseManagementUtils.largePadding(),
    );
  }
}
