import 'package:equatable/equatable.dart';

class PostsByCategoryNSubCategoryNWebsiteRequest extends Equatable {
  final String category;
  final String subCategory;
  final String website;
  final int seen;
  final int pageNum;

  const PostsByCategoryNSubCategoryNWebsiteRequest({
    required this.category,
    required this.subCategory,
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [category, subCategory, website,seen,pageNum];
}