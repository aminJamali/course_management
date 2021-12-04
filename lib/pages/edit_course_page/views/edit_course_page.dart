import 'package:course_management/pages/edit_course_page/controllers/edit_course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:course_management/course_management.dart';
import 'package:taav_ui/taav_ui.dart';
import '../../../generated/locales.g.dart';

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
      title: TaavText(
        LocaleKeys.course_management_shared_edit.tr,
        style: const TextStyle(
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
            label: LocaleKeys.course_management_course_course_title.tr,
            controller: controller.courseTitleController,
            isRequired: true,
            requiredErrorMessage:
                LocaleKeys.course_management_shared_fill_the_forms.tr,
          ),
          CourseManagementUtils.dividerSizedBox(),
          TaavTextField(
            label: LocaleKeys.course_management_course_course_unit.tr,
            controller: controller.courseUnitController,
            taavInputFormatter: TaavInputFormatter.integer,
            isRequired: true,
            requiredErrorMessage:
                LocaleKeys.course_management_shared_fill_the_forms.tr,
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
        label: LocaleKeys.course_management_shared_edit.tr,
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
        label: LocaleKeys.course_management_shared_try_again.tr,
      ),
    );
  }

  _onSubmitButton() async {
    await controller.editCourse();
  }

  void _onRefreshButton() {}
}
