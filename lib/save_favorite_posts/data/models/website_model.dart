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

List<WebsiteResponse> websiteResponse = [];