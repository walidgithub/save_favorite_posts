part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<PostsReponse> postsList;
  final RequestState postsState;
  final String postsMessage;

  const SearchState({
    this.postsList = const [],
    this.postsState = RequestState.loading,
    this.postsMessage = '',
  });

  SearchState copyWith({
    List<PostsReponse>? postsList,
    RequestState? postsState,
    String? postsMessage,
  }) {
    return SearchState(
      postsList: postsList ?? this.postsList,
      postsState: postsState ?? this.postsState,
      postsMessage: postsMessage ?? this.postsMessage,
    );
  }

  @override
  List<Object?> get props => [postsList, postsState, postsMessage];
}

class Empty extends SearchState{}