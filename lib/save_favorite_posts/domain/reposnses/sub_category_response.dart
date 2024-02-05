import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';

class SubCategoryResponse extends FilterResponse {
  final int id;
  final String title;

  const SubCategoryResponse({
    required this.id,
    required this.title,
  }) : super(id: id, title: title);
}


List<SubCategoryResponse> subCategoryResponse = [
  SubCategoryResponse(id: 1, title: 'None'),
  SubCategoryResponse(id: 2, title: 'Designs'),
  SubCategoryResponse(id: 3, title: 'Git'),
  SubCategoryResponse(id: 4, title: 'Problems'),
  SubCategoryResponse(id: 4, title: 'Problems 2'),
  SubCategoryResponse(id: 4, title: 'Problems 3'),
  SubCategoryResponse(id: 4, title: 'Problems 4'),
];