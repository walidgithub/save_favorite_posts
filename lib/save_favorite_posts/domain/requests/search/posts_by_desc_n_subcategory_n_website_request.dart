import 'package:equatable/equatable.dart';

class PostsByDescNSubCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String subCategory;
  final String website;
  final int seen;

  const PostsByDescNSubCategoryNWebsiteRequest({
    required this.description,
    required this.subCategory,
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description, subCategory, website,seen];
}