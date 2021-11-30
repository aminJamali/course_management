import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:course_management/infastructures/infrastructures_exports.dart';
import 'package:course_management/pages/add_course_page/controllers/add_course_controller.dart';
import 'package:taav_ui/taav_ui.dart';

class AddCoursePage extends GetView<AddCourseController> {
  const AddCoursePage({Key? key}) : super(key: key);

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
        'افزودن درس',
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

  _buildSubmitButton() {
    return Container(
      margin: EdgeInsets.only(top: CourseManagementUtils.largePadding()),
      child: TaavButton(
        showLoading: controller.isWaiting.value,
        onTap: _onSubmitButtonTapped,
        buttonType: TaavButtonType.filled,
        label: 'افزودن دوره',
      ),
    );
  }

  _onSubmitButtonTapped() async {
    await controller.addCourse();
  }
}
