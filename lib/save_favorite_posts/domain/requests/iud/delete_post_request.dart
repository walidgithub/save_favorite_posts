import 'package:equatable/equatable.dart';

class DeletePostRequest extends Equatable {
  final int id;

  const DeletePostRequest({
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