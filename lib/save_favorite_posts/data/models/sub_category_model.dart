import '../../domain/reposnses/sub_category_response.dart';

class SubCategoryModel extends SubCategoryResponse {
  const SubCategoryModel({
    required super.id,
    required super.title,
    required super.user,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
      user: json['user'],
    );
  }
}