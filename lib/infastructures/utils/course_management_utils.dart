import 'package:course_management/pages/shared/models/advanced_search_type.dart';
import 'package:course_management/pages/shared/models/advanced_search_view_model.dart';
import 'package:course_management/pages/shared/models/database_mode.dart';
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

  static String generateQuery(
      final List<AdvancedSearchViewModel> chipsList, final DatabaseMode mode) {
    final List<String> query = [];

    switch (mode) {
      case DatabaseMode.taav:
        for (final chip in chipsList) {
          if (chip.type == AdvancedSearchType.range) {
            if (chip.startValue != null && chip.startValue!.trim() != '') {
              query.add('${chip.key} GreaterThanEqual ${chip.startValue}');
            }
            if (chip.endValue != null && chip.endValue!.trim() != '') {
              query.add('${chip.key} lessThanOrEqual ${chip.endValue}');
            }
          } else {
            query.add('${chip.key}=${chip.startValue}');
          }
        }

        break; ///////////////////////////////////////////
      case DatabaseMode.taavV2:
        for (final chip in chipsList) {
          if (chip.type == AdvancedSearchType.range) {
            if (chip.startValue != null && chip.startValue!.trim() != '') {
              query.add('start${chip.key}=${chip.startValue}');
            }
            if (chip.endValue != null && chip.endValue!.trim() != '') {
              query.add('end${chip.key}=${chip.endValue}');
            }
          } else {
            query.add('${chip.key}=${chip.startValue}');
          }
        }

        break;
      case DatabaseMode.jsonServer:
        for (final chip in chipsList) {
          if (chip.type == AdvancedSearchType.equals) {
            query.add('${chip.key}=${chip.startValue}');
          } /////////////////////////////////////////////
          else if (chip.type == AdvancedSearchType.limit) {
            query.add('_${chip.key}=${chip.startValue}');
          } /////////////////////////////////////////////
          else if (chip.type == AdvancedSearchType.offset) {
            query.add('_page=${chip.startValue}');
          } /////////////////////////////////////////////
          else if (chip.type == AdvancedSearchType.contains) {
            query.add('${chip.key}_like=${chip.startValue}');
          } /////////////////////////////////////////////
          else if (chip.type == AdvancedSearchType.range) {
            if (chip.startValue != null && chip.startValue!.trim() != '') {
              query.add('${chip.key}_gte=${chip.startValue}');
            }
            if (chip.endValue != null && chip.endValue!.trim() != '') {
              query.add('${chip.key}_lte=${chip.endValue}');
            }
          }
        }

        break;
    }

    return '?${query.join('&')}';
  }
}
