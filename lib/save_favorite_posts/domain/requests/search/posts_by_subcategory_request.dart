import 'package:equatable/equatable.dart';

class PostsBySubCategoryRequest extends Equatable {
  final String subCategory;
  final int seen;

  const PostsBySubCategoryRequest({
    required this.subCategory,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'subCategory': subCategory,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [subCategory,seen];
}