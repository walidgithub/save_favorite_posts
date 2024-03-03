import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String category;
  final String website;
  final int seen;
  final int pageNum;

  const PostsByDescNCategoryNWebsiteRequest({
    required this.description,
    required this.category,
    required this.website,
    required this.seen,
    required this.pageNum,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'website': website,
      'seen': seen,
      'pageNum': pageNum,
    };
  }

  @override
  List<Object?> get props => [description, category, website,seen,pageNum];
}