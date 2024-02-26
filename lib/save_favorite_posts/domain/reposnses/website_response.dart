import 'filter_response.dart';

class WebsiteResponse extends FilterResponse {
  int? id;
  String? title;

  WebsiteResponse({
    this.id,
    this.title,
  }) : super(id: id, title: title);
}