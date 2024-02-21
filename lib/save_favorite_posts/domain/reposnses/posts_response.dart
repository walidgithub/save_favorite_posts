import 'package:equatable/equatable.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/user_response.dart';

class PostsResponse extends Equatable {
  final int id;
  final String category;
  final String subCategory;
  final String website;
  final String description;
  final String link;
  final int seen;

  const PostsResponse({
    required this.id,
    required this.category,
    required this.subCategory,
    required this.website,
    required this.description,
    required this.link,
    required this.seen,
  });

  @override
  List<Object?> get props => [id, category, subCategory, website, description, link, seen];
}