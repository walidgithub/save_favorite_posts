import 'package:equatable/equatable.dart';

class SearchFilter extends Equatable {
  String? searchText;
  String? website;
  String? category;
  String? subCategory;
  int? seen;

  SearchFilter({
    required this.searchText,
    required this.website,
    required this.category,
    required this.subCategory,
    required this.seen
  });

  @override
  List<Object?> get props => [searchText, website, category, subCategory, seen];
}

List<SearchFilter> searchFilter = [SearchFilter(subCategory: 'All',category: 'All',website: 'All',searchText: '',seen: 0)];