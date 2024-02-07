import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String searchText;
  final String website;
  final String category;
  final String subCategory;

  const Search({
    required this.searchText,
    required this.website,
    required this.category,
    required this.subCategory,
  });

  @override
  List<Object?> get props => [searchText, website, category, subCategory];
}