import 'package:equatable/equatable.dart';

class PostsByCategoryRequest extends Equatable {
  final String category;

  const PostsByCategoryRequest({
    required this.category,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
    };
  }

  @override
  List<Object?> get props => [category];
}