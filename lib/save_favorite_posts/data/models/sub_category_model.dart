import '../../domain/reposnses/sub_category_response.dart';

class SubCategoryModel extends SubCategoryResponse {
  const SubCategoryModel({
    required super.id,
    required super.title,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}