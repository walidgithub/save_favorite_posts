import 'filter_response.dart';

class WebsiteResponse extends FilterResponse {
  final int id;
  final String title;

  const WebsiteResponse({
    required this.id,
    required this.title,
  }) : super(id: id, title: title);
}