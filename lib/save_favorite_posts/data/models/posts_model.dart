import '../../domain/reposnses/posts_response.dart';

class PostsModel extends PostsResponse {
  const PostsModel({
    required super.id,
    required super.category,
    required super.subCategory,
    required super.website,
    required super.seen,
    required super.description,
    required super.link,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['postId'],
      category: json['category'],
      subCategory: json['subCategory'],
      website: json['website'],
      seen: json['seen'],
      description: json['description'],
      link: json['postLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': id,
      'category': category,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
      'description': description,
      'postLink': link,
    };
  }
}