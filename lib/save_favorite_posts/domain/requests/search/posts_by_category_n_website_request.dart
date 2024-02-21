import 'package:equatable/equatable.dart';

class PostsByCategoryNWebsiteRequest extends Equatable {
  final String category;
  final String website;

  const PostsByCategoryNWebsiteRequest({
    required this.category,
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'website': website,
    };
  }

  @override
  List<Object?> get props => [category, website];
}