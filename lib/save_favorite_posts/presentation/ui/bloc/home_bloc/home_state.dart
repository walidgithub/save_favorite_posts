part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<PostsReponse> postsList;
  final RequestState postsState;
  final String postsMessage;

  const HomeState({
    this.postsList = const [],
    this.postsState = RequestState.loading,
    this.postsMessage = '',
  });

  HomeState copyWith({
    List<PostsReponse>? postsList,
    RequestState? postsState,
    String? postsMessage,
  }) {
    return HomeState(
      postsList: postsList ?? this.postsList,
      postsState: postsState ?? this.postsState,
      postsMessage: postsMessage ?? this.postsMessage,
    );
  }

  @override
  List<Object?> get props => [postsList, postsState, postsMessage];
}