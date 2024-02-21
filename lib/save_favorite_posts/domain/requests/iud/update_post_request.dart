import 'package:equatable/equatable.dart';

class UpdatePostRequest extends Equatable {
  final int id;
  final String category;
  final String subCategory;
  final String website;
  final int seen;
  final String description;
  final String link;

  const UpdatePostRequest({
    required this.id,
    required this.category,
    required this.subCategory,
    required this.website,
    required this.seen,
    required this.description,
    required this.link,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'subCategory': subCategory,
      'website': website,
      'seen': seen,
      'description': description,
      'link': link,
    };
  }

  @override
  List<Object?> get props => [id, category, subCategory, website, seen, description, link];
}