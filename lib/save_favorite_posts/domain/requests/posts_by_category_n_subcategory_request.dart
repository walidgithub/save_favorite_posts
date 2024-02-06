import 'package:equatable/equatable.dart';

class PostsByCategoryNSubCategoryRequest extends Equatable {
  final String category;
  final String subCategory;

  const PostsByCategoryNSubCategoryRequest({
    required this.category,
    required this.subCategory,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'subCategory': subCategory,
    };
  }

  @override
  List<Object?> get props => [category, subCategory];
}