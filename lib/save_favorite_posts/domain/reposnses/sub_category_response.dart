import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';

class SubCategoryResponse extends FilterResponse {
  final int id;
  final String title;

  const SubCategoryResponse({
    required this.id,
    required this.title,
  }) : super(id: id, title: title);
}