import 'package:equatable/equatable.dart';

class PostsByDescNSubCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String subCategory;
  final String website;
  final int seen;
  final int pageNum;

  const PostsByDescNSubCategoryNWebsiteRequest({
    required this.description,
    required this.subCategory,
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description, subCategory, website,seen,pageNum];
}