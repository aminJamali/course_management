class StudentViewModel {
  late int id;
  late String name, family, mobile;
  late List<dynamic> courses;
  StudentViewModel({
    required this.id,
    required this.name,
    required this.family,
    required this.mobile,
    required this.courses,
  });

  StudentViewModel.fromJson(final Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
    courses = json['courses'];
  }
}
