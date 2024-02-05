
import 'filter_response.dart';

class WebsiteResponse extends FilterResponse {
  final int id;
  final String title;

  const WebsiteResponse({
    required this.id,
    required this.title,
  }) : super(id: id, title: title);
}


List<WebsiteResponse> websiteResponse = [
  WebsiteResponse(id: 1, title: 'None'),
  WebsiteResponse(id: 2, title: 'LinkedIn'),
  WebsiteResponse(id: 3, title: 'Facebook'),
  WebsiteResponse(id: 4, title: 'YouTube'),
];