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

List<SubCategoryResponse> subCategoryResponse = [];