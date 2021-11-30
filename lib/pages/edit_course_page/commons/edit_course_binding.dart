import 'package:course_management/pages/edit_course_page/controllers/edit_course_controller.dart';
import 'package:get/get.dart';

class EditCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCourseController());
  }
}
