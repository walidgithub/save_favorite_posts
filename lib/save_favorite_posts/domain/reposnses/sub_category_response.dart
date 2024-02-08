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