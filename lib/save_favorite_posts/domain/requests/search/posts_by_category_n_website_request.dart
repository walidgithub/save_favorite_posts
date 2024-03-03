import 'package:equatable/equatable.dart';

class PostsByCategoryNWebsiteRequest extends Equatable {
  final String category;
  final String website;
  final int seen;
  final int pageNum;

  const PostsByCategoryNWebsiteRequest({
    required this.category,
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [category, website,seen,pageNum];
}