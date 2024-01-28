part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<TestResponse> testList;
  final RequestState testState;
  final String testMessage;

  const HomeState({
    this.testList = const [],
    this.testState = RequestState.loading,
    this.testMessage = '',
  });

  HomeState copyWith({
    List<TestResponse>? testList,
    RequestState? testState,
    String? testMessage,
  }) {
    return HomeState(
      testList: testList ?? this.testList,
      testState: testState ?? this.testState,
      testMessage: testMessage ?? this.testMessage,
    );
  }

  @override
  List<Object?> get props => [testList, testState, testMessage];
}