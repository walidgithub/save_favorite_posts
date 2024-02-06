import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/user_response.dart';

class SubCategoryResponse extends FilterResponse {
  final int id;
  final String title;
  final UserResponse user;

  const SubCategoryResponse({
    required this.id,
    required this.title,
    required this.user,
  }) : super(id: id, title: title, user: user);
}


List<SubCategoryResponse> subCategoryResponse = [
  SubCategoryResponse(id: 1, title: 'None', user: userResponse[0]),
  SubCategoryResponse(id: 2, title: 'Designs', user: userResponse[0]),
  SubCategoryResponse(id: 3, title: 'Git', user: userResponse[1]),
  SubCategoryResponse(id: 4, title: 'Problems', user: userResponse[1]),
];