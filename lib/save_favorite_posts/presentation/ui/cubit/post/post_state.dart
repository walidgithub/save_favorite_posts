import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/filter_response.dart';
import '../../../../domain/reposnses/posts_response.dart';

class PostState extends Equatable {
  final List<FilterResponse> filterList;
  final int postId;
  final RequestState postState;
  final String postMessage;

  const PostState({
    this.filterList = const [],
    this.postId = 0,
    this.postState = RequestState.loading,
    this.postMessage = '',
  });

  PostState copyWith({
    List<FilterResponse>? filterList,
    int? postId,
    RequestState? searchState,
    String? postMessage,
  }) {
    return PostState(
      filterList: filterList ?? this.filterList,
      postId: postId ?? this.postId,
      postState: searchState ?? this.postState,
      postMessage: postMessage ?? this.postMessage,
    );
  }

  @override
  List<Object?> get props => [filterList, postId, postState, postMessage];
}