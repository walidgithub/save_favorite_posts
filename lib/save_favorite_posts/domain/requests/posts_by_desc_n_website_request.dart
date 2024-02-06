import 'package:equatable/equatable.dart';

class PostsByDesNWebsiteRequest extends Equatable {
  final String description;
  final String website;

  const PostsByDesNWebsiteRequest({
    required this.description,
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'subCategory': website,
    };
  }

  @override
  List<Object?> get props => [description, website];
}