import 'filter_response.dart';

class WebsiteResponse extends FilterResponse {
  @override
  int? id;
  @override
  String? title;

  WebsiteResponse({
    this.id,
    this.title,
  }) : super(id: id, title: title);
}