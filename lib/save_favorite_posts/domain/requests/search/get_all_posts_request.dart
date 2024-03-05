import 'package:equatable/equatable.dart';

class GetAllPostsRequest extends Equatable {
  final int seen;

  const GetAllPostsRequest({
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [seen];
}