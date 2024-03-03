import 'package:equatable/equatable.dart';

class GetAllPostsRequest extends Equatable {
  final int seen;
  final int pageNum;

  const GetAllPostsRequest({
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [seen,pageNum];
}