import 'package:zekr/models/category_model.dart';
import 'package:zekr/models/zikr_model.dart';

class AzkarModel {
  final List<CategoryModel> categories;
  final List<ZikrModel> azkar;

  AzkarModel({
    required this.categories,
    required this.azkar,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      categories: (json['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      azkar: (json['azkar'] as List)
          .map((e) => ZikrModel.fromJson(e))
          .toList(),
    );
  }
}