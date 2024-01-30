import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';

class CategoryModel extends CategoryResponse {
  const CategoryModel({
    required super.id,
    required super.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}