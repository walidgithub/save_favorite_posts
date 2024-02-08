import 'package:save_favorite_posts/save_favorite_posts/data/models/user_model.dart';

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

List<SubCategoryModel> subCategoryModel = [
  SubCategoryModel(id: 1, title: 'None', user: userModel[0]),
  SubCategoryModel(id: 2, title: 'Designs', user: userModel[0]),
  SubCategoryModel(id: 3, title: 'Animation', user: userModel[0]),
  SubCategoryModel(id: 4, title: 'Examples', user: userModel[0]),
  SubCategoryModel(id: 5, title: 'Projects', user: userModel[0]),
  SubCategoryModel(id: 6, title: 'Packages', user: userModel[0]),
];