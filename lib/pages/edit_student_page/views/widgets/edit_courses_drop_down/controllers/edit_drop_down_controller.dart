import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/edit_student_page/views/widgets/edit_courses_drop_down/repositories/edit_drop_down_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class EditDropDownController extends GetxController {
  RxBool isWaiting = false.obs;
  List<CourseViewModel> courses = [];

  EditDropDownRepository editDropDownRepository =
      EditDropDownRepository(onExceptionReport: (final exceptionKey) {
    TaavToastManager().showToast(exceptionKey);
  });
  Future getAllCourses() async {
    isWaiting(true);
    final Either<String, dynamic> result =
        await editDropDownRepository.getAllCourses();
    isWaiting(false);
    result.fold((exception) {}, (result) {
      courses = result;

      return Right(courses);
    });
  }

  @override
  void onInit() {
    super.onInit();
    getAllCourses();
  }
}
