import 'package:equatable/equatable.dart';

class PostsByWebsiteRequest extends Equatable {
  final String website;
  final int seen;
  final int pageNum;

  const PostsByWebsiteRequest({
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [website,seen,pageNum];
}