import 'package:equatable/equatable.dart';

class PostsByDescRequest extends Equatable {
  final String description;
  final int seen;
  final int pageNum;

  const PostsByDescRequest({
    required this.description,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description,seen,pageNum];
}