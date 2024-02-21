import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/posts_response.dart';

class SearchState extends Equatable {
  final List<PostsResponse> postsList;
  final int postId;
  final RequestState postsState;
  final String postsMessage;

  const SearchState({
    this.postsList = const [],
    this.postId = 0,
    this.postsState = RequestState.loading,
    this.postsMessage = '',
  });

  SearchState copyWith({
    List<PostsResponse>? postsList,
    int? postId,
    RequestState? postsState,
    String? postsMessage,
  }) {
    return SearchState(
      postsList: postsList ?? this.postsList,
      postId: postId ?? this.postId,
      postsState: postsState ?? this.postsState,
      postsMessage: postsMessage ?? this.postsMessage,
    );
  }

  @override
  List<Object?> get props => [postsList, postId, postsState, postsMessage];
}