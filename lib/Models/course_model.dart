class CourseModel {
  final String name;
  final String image;
  final String department;
  final String instructor;
  final List<String> videos;
  final List<String> nameofvideos;

  CourseModel({
    required this.name,
    required this.image,
    required this.department,
    required this.instructor,
    required this.videos,
    required this.nameofvideos,

  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'] ?? 'Unknown Course',
      image: json['image'] ?? 'default_image_url',
      department: json['department'] ?? 'Unknown Course',
      instructor: json['instructor'] ?? 'Unknown Course',
      videos: List<String>.from(json['videos'] ?? []),
      nameofvideos: List<String>.from(json['nameofvideos'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'department': department,
      'instructor': instructor,
      'videos': videos,
      'nameofvideos':nameofvideos,
    };
  }
}
