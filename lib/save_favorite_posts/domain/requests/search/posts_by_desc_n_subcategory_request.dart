import 'package:equatable/equatable.dart';

class PostsByDescNSubCategoryRequest extends Equatable {
  final String description;
  final String subCategory;
  final int seen;
  final int pageNum;

  const PostsByDescNSubCategoryRequest({
    required this.description,
    required this.subCategory,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'subCategory': subCategory,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description, subCategory,seen,pageNum];
}