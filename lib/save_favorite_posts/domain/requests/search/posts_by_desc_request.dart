import 'package:equatable/equatable.dart';

class PostsByDescRequest extends Equatable {
  final String description;
  final int seen;

  const PostsByDescRequest({
    required this.description,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description,seen];
}