import 'package:equatable/equatable.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/user_response.dart';

class FilterResponse extends Equatable {
  final int id;
  final String title;
  final UserResponse user;

  const FilterResponse({
    required this.id,
    required this.title,
    required this.user,
  });

  @override
  List<Object?> get props => [id, title, user];
}