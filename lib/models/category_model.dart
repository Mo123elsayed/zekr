class CategoryModel {
  final String id;
  final String title;
  // final String icon;

  const CategoryModel({
    required this.id,
    required this.title,
    // required this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      // icon: json['icon'],
    );
  }
}