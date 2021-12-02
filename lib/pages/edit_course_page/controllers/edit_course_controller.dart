import 'package:course_management/pages/add_course_page/models/add_course_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/edit_course_page/repositories/edit_course_repository.dart';
import 'package:course_management/pages/shared/views/success_dialog.dart';
import 'package:taav_http_client/taav_http_client.dart';
import 'package:taav_ui/taav_ui.dart';

class EditCourseController extends GetxController {
  late TaavHttpClient taavHttpClient;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isWaiting = false.obs;
  RxBool refreshMode = false.obs;
  late int courseId;
  TextEditingController courseTitleController = TextEditingController();
  TextEditingController courseUnitController = TextEditingController();
  late CourseViewModel receivedCourseById;
  String successMessage = 'با موفقیت تغییر کرد';
  EditCourseRepository editCourseRepository =
      EditCourseRepository(onExceptionReport: (final exceptionKey) {
    TaavToastManager().showToast(exceptionKey);
  });

  Future editCourse() async {
    isWaiting(true);
    final Either<String, dynamic> result =
        await editCourseRepository.editCourse(_editCourseDto);
    isWaiting(false);
    result.fold((exception) {}, (result) {
      showSuccessDialog();
      Future.delayed(const Duration(milliseconds: 2000), () {
        Get.back();
        Get.back(
          result: _editCourseDto.toListItemViewModel(courseId),
        );
      });
    });
  }

  Future getCourseById() async {
    isWaiting(true);
    final Either<String, dynamic> result =
        await editCourseRepository.getCourseById(courseId);
    isWaiting(false);
    result.fold((exception) {
      refreshMode(true);
    }, (result) {
      refreshMode(false);
      receivedCourseById = result;
      _initForEdit();
    });
  }

  void showSuccessDialog() async {
    await TaavDialog.showDialog(
        context: Get.context,
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (final context, final anim1, final anim2) => SuccessDialog(
              text: successMessage,
            ));
  }

  void _initForEdit() {
    courseTitleController.text = receivedCourseById.title;
    courseUnitController.text = receivedCourseById.unit.toString();
  }

  AddCourseDto get _editCourseDto => AddCourseDto(
        id: courseId,
        title: courseTitleController.text,
        unit: int.parse(courseUnitController.text),
      );

  @override
  void onInit() {
    super.onInit();
    courseId = Get.parameters['id'].toIntOrNull();
    getCourseById();
  }
}
