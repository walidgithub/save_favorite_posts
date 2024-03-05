import 'package:equatable/equatable.dart';

class PostsBySubCategoryNWebsiteRequest extends Equatable {
  final String subCategory;
  final String website;
  final int seen;

  const PostsBySubCategoryNWebsiteRequest({
    required this.subCategory,
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [subCategory, website,seen];
}