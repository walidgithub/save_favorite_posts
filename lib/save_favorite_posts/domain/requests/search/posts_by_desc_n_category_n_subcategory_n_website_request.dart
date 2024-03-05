import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNSubCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String category;
  final String subCategory;
  final String website;
  final int seen;

  const PostsByDescNCategoryNSubCategoryNWebsiteRequest({
    required this.description,
    required this.category,
    required this.subCategory,
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description, category, subCategory, website,seen];
}