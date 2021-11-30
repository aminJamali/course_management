import 'package:get/get.dart';
import 'package:course_management/pages/add_course_page/controllers/add_course_controller.dart';

class AddCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCourseController());
  }
}
