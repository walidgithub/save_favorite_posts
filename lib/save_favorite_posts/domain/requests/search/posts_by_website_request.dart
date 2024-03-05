import 'package:equatable/equatable.dart';

class PostsByWebsiteRequest extends Equatable {
  final String website;
  final int seen;

  const PostsByWebsiteRequest({
    required this.website,
    required this.seen,
  });


  Map<String, dynamic> toJson() {
    return {
      'website': website,
      'seen': seen,
    };
  }

  @override
  List<Object?> get props => [website,seen];
}