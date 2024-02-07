
import '../../domain/reposnses/posts_response.dart';

class PostsModel extends PostsReponse {
  const PostsModel({
    required super.id,
    required super.category,
    required super.subCategory,
    required super.website,
    required super.seen,
    required super.description,
    required super.link,
    required super.user,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
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