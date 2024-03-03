import 'package:equatable/equatable.dart';

class PostsByCategoryNSubCategoryRequest extends Equatable {
  final String category;
  final String subCategory;
  final int seen;
  final int pageNum;

  const PostsByCategoryNSubCategoryRequest({
    required this.category,
    required this.subCategory,
    required this.seen,
    required this.pageNum,

  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'subCategory': subCategory,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [category, subCategory,seen,pageNum];
}