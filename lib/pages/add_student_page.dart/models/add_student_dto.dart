import 'package:course_management/pages/edit_course_page/models/course_view_model.dart';

class AddStudentDto {
  late int id;
  late String name, family, mobile;
  late List<CourseViewModel> courses;
  AddStudentDto(
      {required this.id,
      required this.name,
      required this.family,
      required this.courses,
      required this.mobile});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['family'] = family;
    data['courses'] = courses;
    data['mobile'] = mobile;
    return data;
  }
}
