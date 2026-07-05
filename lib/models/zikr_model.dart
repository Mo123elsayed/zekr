class ZikrModel {
  final int id;
  final String categoryId;
  final String text;
  final int repeat;
  final String virtue;
  final String transliteration;
  final String translation;

  ZikrModel({
    required this.id,
    required this.categoryId,
    required this.text,
    required this.repeat,
    required this.virtue,
    required this.transliteration,
    required this.translation,
  });

  factory ZikrModel.fromJson(Map<String, dynamic> json) {
    return ZikrModel(
      id: json['id'],
      categoryId: json['category_id'],
      text: json['text'],
      repeat: json['repeat'],
      virtue: json['virtue'],
      transliteration: json['transliteration'],
      translation: json['translation'],
    );
  }
}
