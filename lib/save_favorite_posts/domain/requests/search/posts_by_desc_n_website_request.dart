import 'package:equatable/equatable.dart';

class PostsByDescNWebsiteRequest extends Equatable {
  final String description;
  final String website;
  final int seen;
  final int pageNum;

  const PostsByDescNWebsiteRequest({
    required this.description,
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description, website,seen,pageNum];
}