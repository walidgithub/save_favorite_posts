import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/posts_response.dart';

class SearchState extends Equatable {
  final List<PostsResponse> searchList;
  final List<PostsResponse> postData;
  final int postId;
  final RequestState searchState;
  final String searchMessage;

  const SearchState({
    this.searchList = const [],
    this.postData = const [],
    this.postId = 0,
    this.searchState = RequestState.initialState,
    this.searchMessage = '',
  });

  SearchState copyWith({
    List<PostsResponse>? searchList,
    List<PostsResponse>? postData,
    RequestState? searchState,
    int? postId,
    String? searchMessage,
  }) {
    return SearchState(
      searchList: searchList ?? this.searchList,
      postData: postData ?? this.postData,
      searchState: searchState ?? this.searchState,
      postId: postId ?? this.postId,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [searchList, postData, searchState, searchMessage, postId];
}