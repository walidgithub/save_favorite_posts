
import '../../domain/reposnses/favorite_posts_response.dart';

class FavoritePostsModel extends PostsReponse {
  const FavoritePostsModel({
    required super.id,
    required super.category,
    required super.subCategory,
    required super.website,
    required super.seen,
    required super.description,
    required super.link,
    required super.user,
  });

  factory FavoritePostsModel.fromJson(Map<String, dynamic> json) {
    return FavoritePostsModel(
      id: (json['id'] as num).toInt(),
      category: json['category'],
      subCategory: json['subCategory'],
      website: json['website'],
      seen: json['seen'],
      description: json['description'],
      link: json['link'],
      user: json['user'],
    );
  }
}