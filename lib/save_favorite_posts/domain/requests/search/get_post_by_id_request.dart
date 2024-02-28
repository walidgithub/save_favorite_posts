import 'package:equatable/equatable.dart';

class GetPostByIdRequest extends Equatable {
  final int id;

  const GetPostByIdRequest({
    required this.id,
  });


  Map<String, dynamic> toJson() {
    return {
      'postId': id,
    };
  }

  @override
  List<Object?> get props => [id];
}