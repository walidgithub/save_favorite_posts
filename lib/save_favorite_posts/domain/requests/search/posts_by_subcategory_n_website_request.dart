import 'package:equatable/equatable.dart';

class PostsBySubCategoryNWebsiteRequest extends Equatable {
  final String subCategory;
  final String website;
  final int seen;
  final int pageNum;

  const PostsBySubCategoryNWebsiteRequest({
    required this.subCategory,
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [subCategory, website,seen,pageNum];
}