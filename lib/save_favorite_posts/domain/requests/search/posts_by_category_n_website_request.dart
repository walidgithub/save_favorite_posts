import 'package:equatable/equatable.dart';

class PostsByCategoryNWebsiteRequest extends Equatable {
  final String category;
  final String website;
  final int seen;

  const PostsByCategoryNWebsiteRequest({
    required this.category,
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [category, website,seen];
}