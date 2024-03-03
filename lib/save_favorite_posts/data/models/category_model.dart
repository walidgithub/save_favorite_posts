import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';

class CategoryModel extends CategoryResponse {
  CategoryModel({
    required super.id,
    required super.title,
  });

  CategoryModel.fromMap(Map<String, dynamic> map) {
    id = map["postId"];
    title = map["category"];
  }
}


List<CategoryResponse> categoryResponse = [
  // CategoryModel(id: 1, title: 'All'),
  // CategoryModel(id: 2, title: 'Flutter'),
  // CategoryModel(id: 3, title: 'UI UX'),
  // CategoryModel(id: 4, title: 'SQL'),
];