import 'package:course_management/pages/add_course_page/models/add_course_dto.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/edit_student_page/models/edit_student_dto.dart';
import 'package:course_management/pages/edit_student_page/models/student_view_model.dart';
import 'package:course_management/pages/edit_student_page/repositories/edit_student_repository.dart';
import 'package:course_management/pages/shared/views/success_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:get/get.dart';

class EditStudentController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isWaiting = false.obs, refreshMode = false.obs;
  TextEditingController nameController = TextEditingController();

  TextEditingController familyController = TextEditingController();

  TextEditingController mobileController = TextEditingController();
  List<CourseViewModel> studentCourses = [];
  late StudentViewModel receivedStudentById;
  List<AddCourseDto> coursesDtos = [];
  String successMessage = 'با موفقیت تغییر یافت';
  EditStudentRepository editStudentRepository =
      EditStudentRepository(onExceptionReport: (final exceptionKey) {
    TaavToastManager().showToast(exceptionKey);
  });

  Future editStudent() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    isWaiting(true);
    studentCourses.forEach((element) {
      coursesDtos.add(
        AddCourseDto(
          id: element.id,
          title: element.title,
          unit: element.unit,
        ),
      );
    });
    final Either<String, dynamic> result =
        await editStudentRepository.editStudent(_editStudentDto);
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

  void _getStudent(int id) async {
    isWaiting(true);
    final Either<String, dynamic> result =
        await editStudentRepository.getStudentById(id);
    isWaiting(false);
    result.fold((exception) {
      refreshMode(true);
    }, (result) {
      refreshMode(false);
      receivedStudentById = result;
      studentCourses = (receivedStudentById.courses as List)
          .map((e) => CourseViewModel.fromJson(e))
          .toList();

      _initForEdit();
    });
  }

  EditStudentDto get _editStudentDto => EditStudentDto(
        id: receivedStudentById.id,
        name: nameController.text,
        family: familyController.text,
        courses: coursesDtos,
        mobile: mobileController.text,
      );

  void _initForEdit() {
    nameController.text = receivedStudentById.name;
    familyController.text = receivedStudentById.family;
    mobileController.text = receivedStudentById.mobile;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getStudent(2);
  }
}
