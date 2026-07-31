class CategoryModel {
  final String id;
  final String title;
  final String titleAr;
  final String icon;

  CategoryModel({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      titleAr: json['titleAr'],
      icon: json['icon'],
    );
  }
}