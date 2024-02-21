import 'package:equatable/equatable.dart';

class PostsByDescNSubCategoryRequest extends Equatable {
  final String description;
  final String subCategory;

  const PostsByDescNSubCategoryRequest({
    required this.description,
    required this.subCategory,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'subCategory': subCategory,
    };
  }

  @override
  List<Object?> get props => [description, subCategory];
}