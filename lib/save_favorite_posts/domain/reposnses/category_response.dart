import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/filter_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/user_response.dart';

class CategoryResponse extends FilterResponse {
  final int id;
  final String title;
  final UserResponse user;

  const CategoryResponse({
    required this.id,
    required this.title,
    required this.user,
  }) : super(id: id, title: title, user: user);
}


List<CategoryResponse> categoryResponse = [
  CategoryResponse(id: 1, title: 'None', user: userResponse[0]),
  CategoryResponse(id: 2, title: 'Flutter', user: userResponse[0]),
  CategoryResponse(id: 3, title: 'FrontEnd', user: userResponse[1]),
  CategoryResponse(id: 4, title: 'General', user: userResponse[1]),
];