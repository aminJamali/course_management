import 'package:course_management/infastructures/utils/course_management_utils.dart';
import 'package:course_management/pages/add_course_page/controllers/add_course_controller.dart';
import 'package:course_management/pages/add_student_page.dart/controllers/add_student_controller.dart';
import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/shared/conrollers/get_course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class AddStudentPage extends GetView<AddStudentController> {
  AddStudentPage({Key? key}) : super(key: key);
  List<CourseViewModel> list = [
    new CourseViewModel(id: 1, title: 'title', unit: 1),
  ];

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
        'افزودن دانش آموز',
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
            label: "نام",
            controller: controller.nameController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          _buildTextFieldsBetweenSizedBox(),
          TaavTextField(
            label: "نام خانوادگی",
            controller: controller.familyController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          _buildTextFieldsBetweenSizedBox(),
          TaavTextField(
            label: "شماره موبایل",
            controller: controller.mobileController,
            isRequired: true,
            requiredErrorMessage: 'لطفا مقداری را وارد کنید',
          ),
          _buildTextFieldsBetweenSizedBox(),
          Obx(() => _courseController.isWaiting != true
              ? _buildCoursesDropDown()
              : CircularProgressIndicator()),
          Obx(
            () => _buildSubmitButton(),
          ),
        ],
      ),
    );
  }

  _buildCoursesDropDown() {
    return TaavDropdown<CourseViewModel>(
      showSearchBox: false,
      label: 'انتخاب دروس',
      popupPadding: EdgeInsets.zero,
      multiSelect: true,
      itemAsString: (final item) => '${item.title}',
      autoFocusSearchBox: true,
      items: _courseController.courses,
      // selectedItemsContainerBuilder:
      //     (final selectedItems, final itemAsString) => Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 10),
      //   child: TaavText.body1(
      //     selectedItems.t,
      //   ),
      // ),
      errorBuilder: (final searchEntry, final exception) => Center(
        child: TaavText.body1(
          'خطا',
          status: TaavWidgetStatus.danger,
        ),
      ),
      emptyBuilder: (final searchEntry) =>
          Center(child: TaavText.body1("چیزی یافت نشد")),
      searchDelay: const Duration(milliseconds: 600),
      compareFunction: (final item, final item2) => item.id == item2.id,
      onItemsSelected: (final value) => _onCourseSelected(value),
    );
  }

  _onCourseSelected(List<CourseViewModel> value) {
    controller.studentCourses = value;
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
        label: 'افزودن دانش آموز',
      ),
    );
  }

  _onSubmitButtonTapped() async {
    await controller.addStudent();
  }

  GetCourseController get _courseController => Get.find<GetCourseController>();
}
