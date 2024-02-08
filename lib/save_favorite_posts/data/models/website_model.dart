import 'package:save_favorite_posts/save_favorite_posts/data/models/user_model.dart';

import '../../domain/reposnses/website_response.dart';

class WebsiteModel extends WebsiteResponse {
  const WebsiteModel({
    required super.id,
    required super.title,
    required super.user,
  });

  factory WebsiteModel.fromJson(Map<String, dynamic> json) {
    return WebsiteModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
      user: json['user'],
    );
  }
}

List<WebsiteModel> websiteModel = [
  WebsiteModel(id: 1, title: 'None', user: userModel[0]),
  WebsiteModel(id: 2, title: 'LinkedIn', user: userModel[0]),
  WebsiteModel(id: 3, title: 'Facebook', user: userModel[0]),
  WebsiteModel(id: 4, title: 'YouTube', user: userModel[0]),
];