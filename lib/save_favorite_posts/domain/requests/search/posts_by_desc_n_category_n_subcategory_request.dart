import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNSubCategoryRequest extends Equatable {
  final String description;
  final String category;
  final String subCategory;
  final int seen;
  final int pageNum;

  const PostsByDescNCategoryNSubCategoryRequest({
    required this.description,
    required this.category,
    required this.subCategory,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description, category, subCategory,seen,pageNum];
}