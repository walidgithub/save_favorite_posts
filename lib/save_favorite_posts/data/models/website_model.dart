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