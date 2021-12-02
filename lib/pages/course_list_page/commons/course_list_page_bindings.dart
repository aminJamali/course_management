import 'package:course_management/pages/course_list_page/controllers/get_course_list_controller.dart';
import 'package:get/get.dart';

class CourseListPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetCourseListController());
  }
}
