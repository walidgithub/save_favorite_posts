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
  // websiteResponse(id: 1, title: 'All'),
  // websiteResponse(id: 2, title: 'LinkedIn'),
  // websiteResponse(id: 3, title: 'Facebook'),
  // websiteResponse(id: 4, title: 'YouTube'),
];