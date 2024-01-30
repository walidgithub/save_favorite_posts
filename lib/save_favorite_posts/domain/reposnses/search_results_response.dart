import 'package:equatable/equatable.dart';

class SearchResultResponse extends Equatable {
  final int id;
  final String category;
  final String subCategory;
  final String website;
  final int seen;

  const SearchResultResponse({
    required this.id,
    required this.category,
    required this.subCategory,
    required this.website,
    required this.seen,
  });

  @override
  List<Object?> get props => [id, category, subCategory, website, seen];
}


List<SearchResultResponse> searchResultResponse = [
  SearchResultResponse(id: 1, category: 'Flutter', subCategory: 'Designs', website: 'LinkedIn', seen: 1),
  SearchResultResponse(id: 2, category: 'FrontEnd', subCategory: 'Git', website: 'LinkedIn', seen: 1),
  SearchResultResponse(id: 3, category: 'FrontEnd', subCategory: 'Git', website: 'YouTube', seen: 0),
  SearchResultResponse(id: 4, category: 'General', subCategory: 'Problems', website: 'FAcebook', seen: 0),
];