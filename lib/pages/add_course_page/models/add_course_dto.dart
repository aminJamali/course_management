class AddCourseDto {
  late String title;
  late int id;
  int? unit;
  AddCourseDto({required this.title, this.unit, required this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['unit'] = unit;
    data['id'] = id;
    return data;
  }
}
