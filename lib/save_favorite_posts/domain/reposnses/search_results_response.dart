import 'package:equatable/equatable.dart';

class SearchResultResponse extends Equatable {
  final int id;
  final String category;
  final String subCategory;
  final String website;
  final String description;
  final String link;
  final int seen;

  const SearchResultResponse({
    required this.id,
    required this.category,
    required this.subCategory,
    required this.website,
    required this.description,
    required this.link,
    required this.seen,
  });

  @override
  List<Object?> get props => [id, category, subCategory, website, description, link, seen];
}


List<SearchResultResponse> searchResultResponse = [
  SearchResultResponse(id: 1, category: 'Flutter', subCategory: 'Designs', website: 'LinkedIn', description: 'sfdsdj  kjsdlkf jsd fdfs',link: 'https://www.linkedin.com' , seen: 1),
  SearchResultResponse(id: 2, category: 'FrontEnd', subCategory: 'Git', website: 'LinkedIn', description: 'jshdf sdfhjsdhfj sdfjsd f hsfdjkh sdfksd',link: 'https://www.linkedin.com', seen: 1),
  SearchResultResponse(id: 3, category: 'FrontEnd', subCategory: 'Git', website: 'YouTube', description: 'sdkjh khkjhsdf kjshdfkjshd fsdfkhsdfkj sdfh skdhf k',link: 'https://www.YouTube.com', seen: 0),
  SearchResultResponse(id: 4, category: 'General', subCategory: 'Problems', website: 'Facebook', description: 'sdfsdfsdf',link: 'https://www.FAcebook.com', seen: 0),
];