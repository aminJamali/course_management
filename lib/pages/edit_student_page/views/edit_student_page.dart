import 'package:course_management/infastructures/utils/course_management_utils.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/edit_student_page/controllers/edit_student_controller.dart';
import 'package:course_management/pages/edit_student_page/views/widgets/edit_courses_drop_down/controllers/edit_drop_down_controller.dart';
import 'package:course_management/pages/edit_student_page/views/widgets/edit_courses_drop_down/views/edit_courses_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class EditStudentPage extends GetView<EditStudentController> {
  const EditStudentPage({Key? key}) : super(key: key);

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
        'تغییر دانش آموز',
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
          Obx(() => _editDropDownController.isWaiting == false
              ? EditCourseDropDown(
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
        label: 'تغییر دانش آموز',
      ),
    );
  }

  _onSubmitButton() async {
    await controller.editStudent();
  }

  EditDropDownController get _editDropDownController =>
      Get.find<EditDropDownController>();
}
