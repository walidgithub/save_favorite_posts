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
}

List<SubCategoryModel> subCategoryModel = [
  SubCategoryModel(id: 1, title: 'None'),
  SubCategoryModel(id: 2, title: 'Designs'),
  SubCategoryModel(id: 3, title: 'Animation'),
  SubCategoryModel(id: 4, title: 'Examples'),
  SubCategoryModel(id: 5, title: 'Projects'),
  SubCategoryModel(id: 6, title: 'Packages'),
];