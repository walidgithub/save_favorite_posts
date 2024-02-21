import 'package:equatable/equatable.dart';

class PostsByDescNCategoryRequest extends Equatable {
  final String description;
  final String category;

  const PostsByDescNCategoryRequest({
    required this.description,
    required this.category,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
    };
  }

  @override
  List<Object?> get props => [description, category];
}