import 'package:course_management/course_management.dart';

class RepositoryUrls {
  static String courseUrl = '${CourseManagementParameters.fulBaseUrl}courses';
  static String addCourseUrl = '$courseUrl';
  static String editCourseUrl(int id) => '$courseUrl/$id';

  static String getCourseByIdUrl(final int id) =>
      '${CourseManagementParameters.fulBaseUrl}courses/$id';
}
