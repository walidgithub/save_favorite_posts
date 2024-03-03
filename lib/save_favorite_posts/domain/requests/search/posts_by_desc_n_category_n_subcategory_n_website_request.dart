import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNSubCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String category;
  final String subCategory;
  final String website;
  final int seen;
  final int pageNum;

  const PostsByDescNCategoryNSubCategoryNWebsiteRequest({
    required this.description,
    required this.category,
    required this.subCategory,
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description, category, subCategory, website,seen,pageNum];
}