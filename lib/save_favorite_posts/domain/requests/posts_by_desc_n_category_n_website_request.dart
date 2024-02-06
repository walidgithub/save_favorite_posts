import 'package:equatable/equatable.dart';

class PostsByDescNCategoryNWebsiteRequest extends Equatable {
  final String description;
  final String category;
  final String website;

  const PostsByDescNCategoryNWebsiteRequest({
    required this.description,
    required this.category,
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'subCategory': website,
    };
  }

  @override
  List<Object?> get props => [description, category, website];
}