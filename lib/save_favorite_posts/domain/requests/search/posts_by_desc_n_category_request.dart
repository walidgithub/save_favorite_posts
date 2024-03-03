import 'package:equatable/equatable.dart';

class PostsByDescNCategoryRequest extends Equatable {
  final String description;
  final String category;
  final int seen;
  final int pageNum;

  const PostsByDescNCategoryRequest({
    required this.description,
    required this.category,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description, category,seen,pageNum];
}