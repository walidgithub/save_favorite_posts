import 'package:equatable/equatable.dart';

class PostsByCategoryNSubCategoryNWebsiteRequest extends Equatable {
  final String category;
  final String subCategory;
  final String website;
  final int seen;

  const PostsByCategoryNSubCategoryNWebsiteRequest({
    required this.category,
    required this.subCategory,
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [category, subCategory, website,seen];
}