import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';
import 'package:course_management/pages/edit_student_page/controllers/edit_student_controller.dart';
import 'package:course_management/pages/edit_student_page/views/widgets/edit_courses_drop_down/controllers/edit_drop_down_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

class EditCourseDropDown extends GetView<EditDropDownController> {
  final Function onCourseSelected;
  const EditCourseDropDown({
    Key? key,
    required this.onCourseSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavDropdown<CourseViewModel>(
      showSearchBox: false,
      label: 'انتخاب دروس',
      popupPadding: EdgeInsets.zero,
      multiSelect: true,
      itemAsString: (final item) => item.title,
      autoFocusSearchBox: true,
      items: controller.courses,
      selectedItems: _editStudentController.studentCourses,
      errorBuilder: (final searchEntry, final exception) => const Center(
        child: TaavText.body1(
          'خطا',
          status: TaavWidgetStatus.danger,
        ),
      ),
      emptyBuilder: (final searchEntry) =>
          const Center(child: TaavText.body1("چیزی یافت نشد")),
      searchDelay: const Duration(milliseconds: 600),
      compareFunction: (final item, final item2) => item.id == item2.id,
      onItemsSelected: (final value) => onCourseSelected(value),
    );
  }

  EditStudentController get _editStudentController =>
      Get.find<EditStudentController>();
}
