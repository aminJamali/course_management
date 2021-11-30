import 'package:course_management/pages/edit_course_page/controllers/edit_course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:course_management/course_management.dart';
import 'package:taav_ui/taav_ui.dart';

class EditCoursePage extends GetView<EditCourseController> {
  const EditCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      showBorder: false,
      padding: EdgeInsets.zero,
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: TaavColors.blue,
      title: const TaavText(
        'تغییر درس',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: TaavColors.white),
      ),
    );
  }

  _buildBody() {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TaavTextField(
            label: "عنوان دوره",
            controller: controller.courseTitleController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          _buildTextFieldsBetweenSizedBox(),
          TaavTextField(
            label: "واحد دوره",
            controller: controller.courseUnitController,
            taavInputFormatter: TaavInputFormatter.integer,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          Obx(
            () => _buildSubmitButton(),
          ),
        ],
      ),
    );
  }

  _buildTextFieldsBetweenSizedBox() {
    return SizedBox(
      height: CourseManagementUtils.largePadding(),
    );
  }

  _buildSubmitButton() {
    return Container(
      margin: EdgeInsets.only(top: CourseManagementUtils.largePadding()),
      child: TaavButton(
        showLoading: controller.isWaiting.value,
        onTap: _onSubmitButtonTapped,
        buttonType: TaavButtonType.filled,
        label: 'تغییر دوره',
      ),
    );
  }

  _onSubmitButtonTapped() async {
    await controller.editCourse();
  }
}
