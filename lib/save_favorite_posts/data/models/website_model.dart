import '../../domain/reposnses/website_response.dart';
import '../../domain/reposnses/website_response.dart';

class WebsiteModel extends WebsiteResponse {
  WebsiteModel({
    super.id,
    super.title,
  });

  WebsiteModel.fromMap(Map<String, dynamic> map) {
    id = map["postId"];
    title = map["website"];
  }
}

List<WebsiteResponse> websiteResponse = [
  // WebsiteModel(id: 1, title: 'None'),
  // WebsiteModel(id: 2, title: 'LinkedIn'),
  // WebsiteModel(id: 3, title: 'Facebook'),
  // WebsiteModel(id: 4, title: 'YouTube'),
];