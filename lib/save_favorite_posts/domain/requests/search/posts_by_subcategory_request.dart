import 'package:equatable/equatable.dart';

class PostsBySubCategoryRequest extends Equatable {
  final String subCategory;
  final int seen;
  final int pageNum;

  const PostsBySubCategoryRequest({
    required this.subCategory,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'subCategory': subCategory,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [subCategory,seen,pageNum];
}