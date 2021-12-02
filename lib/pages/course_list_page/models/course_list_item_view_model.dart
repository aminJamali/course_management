class CourseListItemViewModel {
  late int id, unit;
  late String title;
  CourseListItemViewModel(
      {required this.id, required this.title, required this.unit});

  CourseListItemViewModel.fromJson(final Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    unit = json['unit'];
  }
}
