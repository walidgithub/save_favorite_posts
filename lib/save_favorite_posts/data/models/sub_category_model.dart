import '../../domain/reposnses/sub_category_response.dart';

class SubCategoryModel extends SubCategoryResponse {
  SubCategoryModel({
    super.id,
    super.title,
  });

  SubCategoryModel.fromMap(Map<String, dynamic> map) {
    id = map["postId"];
    title = map["subCategory"];
  }
}

List<SubCategoryResponse> subCategoryResponse = [
  // SubCategoryModel(id: 1, title: 'None'),
  // SubCategoryModel(id: 2, title: 'Designs'),
  // SubCategoryModel(id: 3, title: 'Animation'),
  // SubCategoryModel(id: 4, title: 'Examples'),
  // SubCategoryModel(id: 5, title: 'Projects'),
  // SubCategoryModel(id: 6, title: 'Packages'),
];