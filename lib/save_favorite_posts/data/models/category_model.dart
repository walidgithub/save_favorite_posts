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


List<CategoryResponse> categoryResponse = [];