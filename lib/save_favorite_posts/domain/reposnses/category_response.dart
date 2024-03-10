import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';

class CategoryResponse extends FilterResponse {
  @override
  int? id;
  @override
  String? title;

  CategoryResponse({
    this.id,
    this.title,
  }) : super(id: id, title: title);
}