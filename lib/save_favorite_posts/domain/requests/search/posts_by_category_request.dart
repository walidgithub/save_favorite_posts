import 'package:equatable/equatable.dart';

class PostsByCategoryRequest extends Equatable {
  final String category;
  final int seen;
  final int pageNum;

  const PostsByCategoryRequest({
    required this.category,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [category,seen,pageNum];
}