import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNSubCategoryRequest extends Equatable {
  final String description;
  final String category;
  final String subCategory;

  const PostsByDescNCategoryNSubCategoryRequest({
    required this.description,
    required this.category,
    required this.subCategory,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'subCategory': subCategory,
    };
  }

  @override
  List<Object?> get props => [description, category, subCategory];
}