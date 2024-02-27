import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/posts_response.dart';

class SearchState extends Equatable {
  final List<PostsResponse> searchList;
  final int postId;
  final RequestState searchState;
  final String searchMessage;

  const SearchState({
    this.searchList = const [],
    this.postId = 0,
    this.searchState = RequestState.initialState,
    this.searchMessage = '',
  });

  SearchState copyWith({
    List<PostsResponse>? searchList,
    RequestState? searchState,
    int? postId,
    String? searchMessage,
  }) {
    return SearchState(
      searchList: searchList ?? this.searchList,
      searchState: searchState ?? this.searchState,
      postId: postId ?? this.postId,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [searchList, searchState, searchMessage, postId];
}