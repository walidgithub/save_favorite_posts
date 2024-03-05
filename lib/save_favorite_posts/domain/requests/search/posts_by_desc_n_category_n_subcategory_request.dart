import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNSubCategoryRequest extends Equatable {
  final String description;
  final String category;
  final String subCategory;
  final int seen;

  const PostsByDescNCategoryNSubCategoryRequest({
    required this.description,
    required this.category,
    required this.subCategory,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description, category, subCategory,seen];
}