import 'package:equatable/equatable.dart';

class PostsBySubCategoryRequest extends Equatable {
  final String subCategory;

  const PostsBySubCategoryRequest({
    required this.subCategory,
  });


  Map<String, dynamic> toJson() {
    return {
      'subCategory': subCategory,
    };
  }

  @override
  List<Object?> get props => [subCategory];
}