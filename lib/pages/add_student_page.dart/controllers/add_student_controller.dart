import 'package:course_management/pages/add_course_page/models/add_course_dto.dart';
import 'package:course_management/pages/add_student_page.dart/models/add_student_dto.dart';
import 'package:course_management/pages/add_student_page.dart/repositories/add_student_repositories.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/shared/views/success_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class AddStudentController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isWaiting = false.obs;
  TextEditingController nameController = TextEditingController();

  TextEditingController familyController = TextEditingController();

  TextEditingController mobileController = TextEditingController();
  List<CourseViewModel> studentCourses = [];
  List<AddCourseDto> courseDtos = [];
  String successMessage = 'با موفقیت اضافه شد';
  AddStudentRepository addStudentRepository =
      AddStudentRepository(onExceptionReport: (final exceptionKey) {
    TaavToastManager().showToast(exceptionKey);
  });

  Future addStudent() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    isWaiting(true);
    studentCourses.forEach((element) {
      courseDtos.add(
        AddCourseDto(
          id: element.id,
          title: element.title,
          unit: element.unit,
        ),
      );
    });
    final Either<String, dynamic> result =
        await addStudentRepository.addStudent(_addStudentDto);
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

  AddStudentDto get _addStudentDto => AddStudentDto(
        id: DateTime.now().millisecondsSinceEpoch,
        name: nameController.text,
        family: familyController.text,
        courses: courseDtos,
        mobile: mobileController.text,
      );
}
