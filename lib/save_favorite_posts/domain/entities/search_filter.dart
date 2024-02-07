import 'package:equatable/equatable.dart';

class SearchFilter extends Equatable {
  String? searchText;
  String? website;
  String? category;
  String? subCategory;

  SearchFilter({
    required this.searchText,
    required this.website,
    required this.category,
    required this.subCategory,
  });

  @override
  List<Object?> get props => [searchText, website, category, subCategory];
}

List<SearchFilter> searchFilter = [SearchFilter(subCategory: 'None',category: 'None',website: 'None',searchText: '')];