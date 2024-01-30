
import '../../domain/reposnses/search_results_response.dart';

class SearchResultModel extends SearchResultResponse {
  const SearchResultModel({
    required super.id,
    required super.category,
    required super.subCategory,
    required super.website,
    required super.seen,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      id: (json['id'] as num).toInt(),
      category: json['category'],
      subCategory: json['subCategory'],
      website: json['website'],
      seen: json['seen'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
    };
  }
}