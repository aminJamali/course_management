import 'package:course_management/pages/edit_student_page/controllers/edit_student_controller.dart';
import 'package:course_management/pages/edit_student_page/views/widgets/edit_courses_drop_down/controllers/edit_drop_down_controller.dart';
import 'package:get/get.dart';

class EditStudentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditStudentController());
    Get.lazyPut(() => EditDropDownController());
  }
}
