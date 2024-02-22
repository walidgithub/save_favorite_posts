import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';

class CategoryResponse extends FilterResponse {
  final int id;
  final String title;

  const CategoryResponse({
    required this.id,
    required this.title,
  }) : super(id: id, title: title);
}