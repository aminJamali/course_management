import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:course_management/pages/add_course_page/models/add_course_dto.dart';
import 'package:course_management/pages/add_course_page/repositories/add_course_repository.dart';
import 'package:course_management/pages/shared/views/success_dialog.dart';
import 'package:taav_ui/taav_ui.dart';

class AddCourseController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isWaiting = false.obs;
  TextEditingController courseTitleController = TextEditingController();
  TextEditingController courseUnitController = TextEditingController();
  String successMessage = 'با موفقیت اضافه شد';
  AddCourseRepository addCourseRepository =
      AddCourseRepository(onExceptionReport: (final exceptionKey) {
    TaavToastManager().showToast(exceptionKey);
  });

  Future addCourse() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    isWaiting(true);
    final Either<String, dynamic> result =
        await addCourseRepository.add(_addCourseDto);
    isWaiting(false);
    result.fold((exception) {}, (result) {
      showSuccessDialog();
      Future.delayed(const Duration(milliseconds: 2000), () {
        Get.back(result: true);
      });
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

  AddCourseDto get _addCourseDto => AddCourseDto(
        id: DateTime.now().millisecondsSinceEpoch,
        title: courseTitleController.text,
        unit: int.parse(courseUnitController.text),
      );
}
