import 'package:equatable/equatable.dart';

class PostsByDescNSubCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String subCategory;
  final String website;

  const PostsByDescNSubCategoryNWebsiteRequest({
    required this.description,
    required this.subCategory,
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'subCategory': subCategory,
      'subCategory': website,
    };
  }

  @override
  List<Object?> get props => [description, subCategory, website];
}