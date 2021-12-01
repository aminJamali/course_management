class CourseViewModel {
  late int id, unit;
  late String title;
  CourseViewModel({required this.id, required this.title, required this.unit});

  CourseViewModel.fromJson(final Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    unit = json['unit'];
  }
}
