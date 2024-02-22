import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/posts_response.dart';

class SearchState extends Equatable {
  final List<PostsResponse> searchList;
  final RequestState searchState;
  final String searchMessage;

  const SearchState({
    this.searchList = const [],
    this.searchState = RequestState.loading,
    this.searchMessage = '',
  });

  SearchState copyWith({
    List<PostsResponse>? searchList,
    RequestState? searchState,
    String? searchMessage,
  }) {
    return SearchState(
      searchList: searchList ?? this.searchList,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [searchList, searchState, searchMessage];
}