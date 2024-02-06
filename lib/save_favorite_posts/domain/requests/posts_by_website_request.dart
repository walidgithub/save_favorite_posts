import 'package:equatable/equatable.dart';

class PostsByWebsiteRequest extends Equatable {
  final String website;

  const PostsByWebsiteRequest({
    required this.website,
  });


  Map<String, dynamic> toJson() {
    return {
      'subCategory': website,
    };
  }

  @override
  List<Object?> get props => [website];
}