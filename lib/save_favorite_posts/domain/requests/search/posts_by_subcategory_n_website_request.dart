import 'package:equatable/equatable.dart';

class PostsBySubCategoryNWebsiteRequest extends Equatable {
  final String subCategory;
  final String website;

  const PostsBySubCategoryNWebsiteRequest({
    required this.subCategory,
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'subCategory': subCategory,
      'website': website,
    };
  }

  @override
  List<Object?> get props => [subCategory, website];
}