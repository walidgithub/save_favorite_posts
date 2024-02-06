import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNSubCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String category;
  final String subCategory;
  final String website;

  const PostsByDescNCategoryNSubCategoryNWebsiteRequest({
    required this.description,
    required this.category,
    required this.subCategory,
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'subCategory': website,
    };
  }

  @override
  List<Object?> get props => [description, category, subCategory, website];
}