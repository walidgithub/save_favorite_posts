import '../../domain/reposnses/website_response.dart';

class WebsiteModel extends WebsiteResponse {
  const WebsiteModel({
    required super.id,
    required super.title,
  });

  factory WebsiteModel.fromJson(Map<String, dynamic> json) {
    return WebsiteModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
    );
  }
}

List<WebsiteModel> websiteModel = [
  WebsiteModel(id: 1, title: 'None'),
  WebsiteModel(id: 2, title: 'LinkedIn'),
  WebsiteModel(id: 3, title: 'Facebook'),
  WebsiteModel(id: 4, title: 'YouTube'),
];