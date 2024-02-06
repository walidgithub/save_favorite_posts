import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';

class CategoryModel extends CategoryResponse {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.user,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
      user: json['user'],
    );
  }
}