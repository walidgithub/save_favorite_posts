import 'package:equatable/equatable.dart';

class PostsByDescNSubCategoryRequest extends Equatable {
  final String description;
  final String subCategory;
  final int seen;

  const PostsByDescNSubCategoryRequest({
    required this.description,
    required this.subCategory,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'subCategory': subCategory,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description, subCategory,seen];
}