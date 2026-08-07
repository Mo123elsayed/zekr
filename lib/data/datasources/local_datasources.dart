import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:zekr/models/azkar_model.dart';
import 'package:zekr/models/category_model.dart';

class LocalDataSource {
  Future<List<CategoryModel>> loadCategories() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/categories.json',
    );

    final List<dynamic> data = jsonDecode(jsonString);
    final parsedData = data.map((e) => CategoryModel.fromJson(e)).toList();

    return parsedData;
  }

  Future<List<AzkarModel>> loadAzkar(String fileName) async {
    final jsonString = await rootBundle.loadString('$fileName');

    final List<dynamic> data = jsonDecode(jsonString);
    final parsedData = data.map((e) => AzkarModel.fromJson(e)).toList();
    return parsedData;
  }
}
