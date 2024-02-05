import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';

class CategoryResponse extends FilterResponse {
  final int id;
  final String title;

  const CategoryResponse({
    required this.id,
    required this.title,
  }) : super(id: id, title: title);
}


List<CategoryResponse> categoryResponse = [
  CategoryResponse(id: 1, title: 'None'),
  CategoryResponse(id: 2, title: 'Flutter'),
  CategoryResponse(id: 3, title: 'FrontEnd'),
  CategoryResponse(id: 4, title: 'General'),
];