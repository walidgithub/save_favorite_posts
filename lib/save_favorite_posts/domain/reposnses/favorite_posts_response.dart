import 'package:equatable/equatable.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/user_response.dart';

class PostsReponse extends Equatable {
  final int id;
  final String category;
  final String subCategory;
  final String website;
  final String description;
  final String link;
  final int seen;
  final UserResponse user;

  const PostsReponse({
    required this.id,
    required this.category,
    required this.subCategory,
    required this.website,
    required this.description,
    required this.link,
    required this.seen,
    required this.user,
  });

  @override
  List<Object?> get props => [id, category, subCategory, website, description, link, seen, user];
}


List<PostsReponse> postsResponse = [
  PostsReponse(id: 1, category: 'Flutter', subCategory: 'Designs', website: 'LinkedIn', description: 'sfdsdj  kjsdlkf jsd fdfs',link: 'https://www.linkedin.com' , seen: 1,user: userResponse[0]),
];