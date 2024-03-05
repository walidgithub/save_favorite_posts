import 'package:equatable/equatable.dart';

class PostsByDescNWebsiteRequest extends Equatable {
  final String description;
  final String website;
  final int seen;

  const PostsByDescNWebsiteRequest({
    required this.description,
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [description, website,seen];
}