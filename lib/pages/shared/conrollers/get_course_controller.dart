import 'dart:convert';

import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/shared/repositories/get_course_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class GetCourseController extends GetxController {
  RxBool isWaiting = false.obs;
  List<CourseViewModel> courses = [];
  GetCourseRepository getCourseRepository =
      GetCourseRepository(onExceptionReport: (final exceptionKey) {
    TaavToastManager().showToast(exceptionKey);
  });
  Future getAllCourses() async {
    isWaiting(true);
    final Either<String, dynamic> result =
        await getCourseRepository.getAllCourses();
    isWaiting(false);
    result.fold((exception) {}, (result) {
      courses = result;

      return Right(courses);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCourses();
  }
}
