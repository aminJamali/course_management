import 'package:course_management/pages/course_list_page/models/course_list_item_view_model.dart';

class AddCourseDto {
  late String title;
  late int id;
  late int unit;
  AddCourseDto({required this.title, required this.unit, required this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['unit'] = unit;
    data['id'] = id;
    return data;
  }

  CourseListItemViewModel toListItemViewModel(final int id) =>
      CourseListItemViewModel(
        id: id,
        title: title,
        unit: unit,
      );
}
