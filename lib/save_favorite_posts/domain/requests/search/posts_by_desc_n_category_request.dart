import 'package:equatable/equatable.dart';

class PostsByDescNCategoryRequest extends Equatable {
  final String description;
  final String category;
  final int seen;

  const PostsByDescNCategoryRequest({
    required this.description,
    required this.category,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description, category,seen];
}