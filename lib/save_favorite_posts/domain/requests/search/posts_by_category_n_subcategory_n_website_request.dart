import 'package:equatable/equatable.dart';

class PostsByCategoryNSubCategoryNWebsiteRequest extends Equatable {
  final String category;
  final String subCategory;
  final String website;

  const PostsByCategoryNSubCategoryNWebsiteRequest({
    required this.category,
    required this.subCategory,
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'subCategory': subCategory,
      'website': website,
    };
  }

  @override
  List<Object?> get props => [category, subCategory, website];
}