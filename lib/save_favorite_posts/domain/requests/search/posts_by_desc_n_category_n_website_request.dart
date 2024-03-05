import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String category;
  final String website;
  final int seen;

  const PostsByDescNCategoryNWebsiteRequest({
    required this.description,
    required this.category,
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description, category, website,seen];
}