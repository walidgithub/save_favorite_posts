
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/user_response.dart';

import 'filter_response.dart';

class WebsiteResponse extends FilterResponse {
  final int id;
  final String title;
  final UserResponse user;

  const WebsiteResponse({
    required this.id,
    required this.title,
    required this.user,
  }) : super(id: id, title: title, user: user);
}