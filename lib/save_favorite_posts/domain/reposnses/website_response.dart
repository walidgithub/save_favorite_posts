import 'package:equatable/equatable.dart';

class WebsiteResponse extends Equatable {
  final int id;
  final String title;

  const WebsiteResponse({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}


List<WebsiteResponse> websiteResponse = [
  WebsiteResponse(id: 1, title: 'All'),
  WebsiteResponse(id: 2, title: 'LinkedIn'),
  WebsiteResponse(id: 3, title: 'Facebook'),
  WebsiteResponse(id: 4, title: 'YouTube'),
];