import 'package:course_management/pages/add_student_page.dart/commons/add_student_bindings.dart';
import 'package:course_management/pages/add_student_page.dart/views/add_student_page.dart';
import 'package:course_management/pages/course_list_page/commons/course_list_page_bindings.dart';
import 'package:course_management/pages/course_list_page/views/course_list_page.dart';
import 'package:course_management/pages/edit_course_page/commons/edit_course_binding.dart';
import 'package:course_management/pages/edit_course_page/views/edit_course_page.dart';
import 'package:course_management/pages/edit_student_page/commons/edit_student_bindings.dart';
import 'package:course_management/pages/edit_student_page/views/edit_student_page.dart';
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
      name: '${CourseManagementRouteNames.editCoursePage}/:id',
      page: () => const EditCoursePage(),
      binding: EditCourseBinding(),
    ),
    GetPage(
      name: CourseManagementRouteNames.addStudentPage,
      page: () => AddStudentPage(),
      binding: AddStudentBindings(),
    ),
    GetPage(
      name: CourseManagementRouteNames.editStudentPage,
      page: () => const EditStudentPage(),
      binding: EditStudentBindings(),
    ),
    GetPage(
      name: CourseManagementRouteNames.courseListPage,
      page: () => const CourseListPage(),
      binding: CourseListPageBindings(),
    ),
  ];
}
