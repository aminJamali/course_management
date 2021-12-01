import 'package:course_management/pages/add_course_page/models/add_course_dto.dart';

class EditStudentDto {
  late int id;
  late String name, family, mobile;
  late List<AddCourseDto> courses;
  EditStudentDto(
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
