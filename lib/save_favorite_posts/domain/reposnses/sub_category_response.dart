import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';

class SubCategoryResponse extends FilterResponse {
  int? id;
  String? title;

  SubCategoryResponse({
    this.id,
    this.title,
  }) : super(id: id, title: title);
}