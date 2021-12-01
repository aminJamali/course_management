import 'package:course_management/infastructures/utils/course_management_utils.dart';
import 'package:course_management/pages/add_student_page.dart/controllers/add_student_controller.dart';
import 'package:course_management/pages/add_student_page.dart/views/widgets/courses_drop_down/courses_drop_down.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/add_student_page.dart/views/widgets/courses_drop_down/controllers/get_course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class AddStudentPage extends GetView<AddStudentController> {
  AddStudentPage({Key? key}) : super(key: key);
  final List<CourseViewModel> list = [
    CourseViewModel(id: 1, title: 'title', unit: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
      appBar: _appBar(),
      body: _body(),
      showBorder: false,
      padding: EdgeInsets.zero,
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: TaavColors.blue,
      title: const TaavText(
        'افزودن دانش آموز',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: TaavColors.white),
      ),
    );
  }

  _body() {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TaavTextField(
            label: "نام",
            controller: controller.nameController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          CourseManagementUtils.dividerSizedBox(),
          TaavTextField(
            label: "نام خانوادگی",
            controller: controller.familyController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          CourseManagementUtils.dividerSizedBox(),
          TaavTextField(
            label: "شماره موبایل",
            controller: controller.mobileController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          CourseManagementUtils.dividerSizedBox(),
          Obx(() => _courseController.isWaiting == false
              ? CourseDropDown(
                  onCourseSelected: (value) => onCourseSelected(value),
                )
              : const CircularProgressIndicator()),
          Obx(
            () => _submitButton(),
          ),
        ],
      ),
    );
  }

  onCourseSelected(List<CourseViewModel> value) {
    controller.studentCourses = value;
  }

  _submitButton() {
    return Container(
      margin: EdgeInsets.only(top: CourseManagementUtils.largePadding()),
      child: TaavButton(
        showLoading: controller.isWaiting.value,
        onTap: _onSubmitButton,
        buttonType: TaavButtonType.filled,
        label: 'افزودن دانش آموز',
      ),
    );
  }

  _onSubmitButton() async {
    await controller.addStudent();
  }

  GetCourseController get _courseController => Get.find<GetCourseController>();
}
