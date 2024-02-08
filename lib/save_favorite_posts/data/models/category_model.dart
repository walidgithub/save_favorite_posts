import 'package:save_favorite_posts/save_favorite_posts/data/models/user_model.dart';
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


List<CategoryModel> categoryModel = [
  CategoryModel(id: 1, title: 'None', user: userModel[0]),
  CategoryModel(id: 2, title: 'Flutter', user: userModel[0]),
  CategoryModel(id: 3, title: 'UI UX', user: userModel[0]),
  CategoryModel(id: 4, title: 'SQL', user: userModel[0]),
];