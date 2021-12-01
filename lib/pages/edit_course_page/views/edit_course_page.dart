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
        'تغییر درس',
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
            label: "عنوان دوره",
            controller: controller.courseTitleController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          CourseManagementUtils.dividerSizedBox(),
          TaavTextField(
            label: "واحد دوره",
            controller: controller.courseUnitController,
            taavInputFormatter: TaavInputFormatter.integer,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          Obx(
            () => _submitButton(),
          ),
          Obx(
            () =>
                controller.refreshMode == true ? _refreshButton() : Container(),
          ),
        ],
      ),
    );
  }

  _submitButton() {
    return Container(
      margin: EdgeInsets.only(top: CourseManagementUtils.largePadding()),
      child: TaavButton(
        showLoading: controller.isWaiting.value,
        onTap: _onSubmitButton,
        buttonType: TaavButtonType.filled,
        label: 'تغییر دوره',
      ),
    );
  }

  _refreshButton() {
    return Container(
      margin: EdgeInsets.only(top: CourseManagementUtils.largePadding()),
      child: TaavButton(
        showLoading: controller.isWaiting.value,
        onTap: _onRefreshButton,
        buttonType: TaavButtonType.filled,
        label: 'تلاش مجدد',
      ),
    );
  }

  _onSubmitButton() async {
    await controller.editCourse();
  }

  void _onRefreshButton() {}
}
