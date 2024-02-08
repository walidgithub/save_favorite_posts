
import 'package:save_favorite_posts/save_favorite_posts/data/models/user_model.dart';

import '../../domain/reposnses/posts_response.dart';

class PostsModel extends PostsReponse {
  const PostsModel({
    required super.id,
    required super.category,
    required super.subCategory,
    required super.website,
    required super.seen,
    required super.description,
    required super.link,
    required super.user,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: (json['id'] as num).toInt(),
      category: json['category'],
      subCategory: json['subCategory'],
      website: json['website'],
      seen: json['seen'],
      description: json['description'],
      link: json['link'],
      user: json['user'],
    );
  }
}

List<PostsModel> postsModel = [
  PostsModel(id: 1, website: 'LinkedIn', category: 'Flutter', subCategory: 'Designs', description: 'using LinkedIn with Flutter with Designs',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 2, website: 'FaceBook', category: 'UI UX', subCategory: 'Animation', description: 'using FaceBook with UI UX with Animation',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 3, website: 'LinkedIn', category: 'SQL', subCategory: 'Designs', description: 'using LinkedIn with SQL with Designs',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 4, website: 'YouTube', category: 'Flutter', subCategory: 'Animation', description: 'using YouTube with Flutter with Animation',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 5, website: 'LinkedIn', category: 'Flutter', subCategory: 'Examples', description: 'using LinkedIn with Flutter with Examples',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 6, website: 'FaceBook', category: 'Flutter', subCategory: 'Designs', description: 'using FaceBook with Flutter with Designs',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 7, website: 'LinkedIn', category: 'UI UX', subCategory: 'Projects', description: 'using LinkedIn with UI UX with Projects',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 8, website: 'LinkedIn', category: 'Flutter', subCategory: 'Designs', description: 'using LinkedIn with Flutter with Designs',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 9, website: 'YouTube', category: 'Flutter', subCategory: 'Examples', description: 'using YouTube with Flutter with Examples',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 10, website: 'LinkedIn', category: 'SQL', subCategory: 'Designs', description: 'using LinkedIn with SQL with Designs',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 11, website: 'LinkedIn', category: 'Flutter', subCategory: 'Packages', description: 'using LinkedIn with Flutter with Packages',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 12, website: 'FaceBook', category: 'Flutter', subCategory: 'Projects', description: 'using FaceBook with Flutter with Projects',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 13, website: 'LinkedIn', category: 'Flutter', subCategory: 'Designs', description: 'using LinkedIn with Flutter with Designs',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 14, website: 'LinkedIn', category: 'SQL', subCategory: 'Packages', description: 'using LinkedIn with SQL with Packages',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
  PostsModel(id: 15, website: 'FaceBook', category: 'UI UX', subCategory: 'Designs', description: 'using FaceBook with UI UX with Designs',link: 'https://www.linkedin.com' , seen: 1,user: userModel[0]),
];