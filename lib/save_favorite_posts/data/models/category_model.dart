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
}


List<CategoryModel> categoryModel = [
  // CategoryModel(id: 1, title: 'None'),
  // CategoryModel(id: 2, title: 'Flutter'),
  // CategoryModel(id: 3, title: 'UI UX'),
  // CategoryModel(id: 4, title: 'SQL'),
];