import 'package:course_management/pages/add_student_page.dart/controllers/add_student_controller.dart';
import 'package:course_management/pages/shared/conrollers/get_course_controller.dart';
import 'package:get/get.dart';

class AddStudentBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddStudentController());
    Get.lazyPut(() => GetCourseController());
  }
}
