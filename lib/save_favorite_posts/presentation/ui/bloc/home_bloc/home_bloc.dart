import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/test_response.dart';
import '../../../../domain/usecases/base_usecase/base_usecase.dart';
import '../../../../domain/usecases/favorite_posts_usecases.dart';
import '../../../../domain/usecases/favorite_posts_with_parmater_usecases.dart';
import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPostsUseCase getPostsUseCase;
  final GetPostsWithParameterUseCase getPostsWithParameterUseCase;

  HomeBloc(this.getPostsUseCase, this.getPostsWithParameterUseCase)
      : super(const HomeState()) {
    on<GetTestEvent>(_getTest);
    on<SearchTestEvent>(_searchForTest);
  }

  FutureOr<void> _getTest(
      GetTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            testState: RequestState.error, testMessage: l.message)),
            (r) => emit(state.copyWith(
              testList: r,
              testState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            testState: RequestState.error, testMessage: l.message)),
            (r) => emit(state.copyWith(
          testList: r,
          testState: RequestState.loaded,
        )));
  }
}