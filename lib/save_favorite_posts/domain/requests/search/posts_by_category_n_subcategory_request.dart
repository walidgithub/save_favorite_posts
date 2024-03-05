import 'package:equatable/equatable.dart';

class PostsByCategoryNSubCategoryRequest extends Equatable {
  final String category;
  final String subCategory;
  final int seen;

  const PostsByCategoryNSubCategoryRequest({
    required this.category,
    required this.subCategory,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'subCategory': subCategory,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [category, subCategory,seen];
}