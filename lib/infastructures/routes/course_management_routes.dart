import 'package:course_management/pages/edit_course_page/commons/edit_course_binding.dart';
import 'package:course_management/pages/edit_course_page/views/edit_course_page.dart';
import 'package:get/get.dart';
import 'package:course_management/course_management.dart';
import 'package:course_management/pages/add_course_page/commons/add_course_binding.dart';
import 'package:course_management/pages/add_course_page/views/add_course_page.dart';

class CourseManagementRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: CourseManagementRouteNames.addCoursePage,
      page: () => const AddCoursePage(),
      binding: AddCourseBinding(),
    ),
    GetPage(
      name: CourseManagementRouteNames.editCoursePage,
      page: () => const EditCoursePage(),
      binding: EditCourseBinding(),
    ),
  ];
}
