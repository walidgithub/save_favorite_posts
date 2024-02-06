import 'package:equatable/equatable.dart';

class PostsByDescRequest extends Equatable {
  final String description;

  const PostsByDescRequest({
    required this.description,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }

  @override
  List<Object?> get props => [description];
}