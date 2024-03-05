import 'package:equatable/equatable.dart';

class PostsByCategoryRequest extends Equatable {
  final String category;
  final int seen;

  const PostsByCategoryRequest({
    required this.category,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [category,seen];
}