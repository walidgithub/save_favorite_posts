import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_category_n_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_subcategory_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_subcategory_n_website_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_website_request.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/favorite_posts_response.dart';
import '../../../../domain/requests/posts_by_category_n_subcategory_n_website_request.dart';
import '../../../../domain/requests/posts_by_category_n_subcategory_request.dart';
import '../../../../domain/requests/posts_by_category_n_website_request.dart';
import '../../../../domain/requests/posts_by_category_request.dart';
import '../../../../domain/requests/posts_by_desc_n_category_n_website_request.dart';
import '../../../../domain/requests/posts_by_desc_n_category_request.dart';
import '../../../../domain/usecases/base_usecase/base_usecase.dart';
import '../../../../domain/usecases/get_all_posts_usecases.dart';
import '../../../../domain/usecases/get_posts_by_category_n_subcategory_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_category_n_subcategory_usecase.dart';
import '../../../../domain/usecases/get_posts_by_category_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_category_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_n_category_n_subcategory_n_website_usecases.dart';
import 'package:bloc/bloc.dart';

import '../../../../domain/usecases/get_posts_by_desc_n_category_n_subcategory_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_n_category_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_n_category_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_n_subcategory_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_n_subcategory_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_usecase.dart';
import '../../../../domain/usecases/get_posts_by_subcategory_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_subcategory_usecase.dart';
import '../../../../domain/usecases/get_posts_by_website_usecase.dart';
part 'home_event.dart';
part 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  final GetPostsByWebsiteUseCase getPostsByWebsiteUseCase;
  final GetPostsBySubCategoryUseCase getPostsBySubCategoryUseCase;
  final GetPostsBySubCategoryNWebsiteUseCase getPostsBySubCategoryNWebsiteUseCase;
  final GetPostsByDescUseCase getPostsByDescUseCase;
  final GetPostsByDesNWebsiteUseCase getPostsByDesNWebsiteUseCase;
  final GetPostsByDescNSubCategoryUseCase getPostsByDescNSubCategoryUseCase;
  final GetPostsByDescNSubCategoryNWebsiteUseCase getPostsByDescNSubCategoryNWebsiteUseCase;
  final GetPostsByDescNCategoryUseCase getPostsByDescNCategoryUseCase;
  final GetPostsByDescNCategoryNWebsiteUseCase getPostsByDescNCategoryNWebsiteUseCase;
  final GetPostsByDescNCategoryNSubCategoryUseCase getPostsByDescNCategoryNSubCategoryUseCase;
  final GetPostsByDescNCategoryNSubCategoryNWebsiteUseCase getPostsByDescNCategoryNSubCategoryNWebsiteUseCase;
  final GetPostsByCategoryUseCase getPostsByCategoryUseCase;
  final GetPostsByCategoryNWebsiteUseCase getPostsByCategoryNWebsiteUseCase;
  final GetPostsByCategoryNSubCategoryUseCase getPostsByCategoryNSubCategoryUseCase;
  final GetPostsByCategoryNSubCategoryNWebsiteUseCase getPostsByCategoryNSubCategoryNWebsiteUseCase;

  HomeBloc(this.getAllPostsUseCase
      , this.getPostsByWebsiteUseCase
      , this.getPostsBySubCategoryUseCase
      , this.getPostsBySubCategoryNWebsiteUseCase
      , this.getPostsByDescUseCase
      , this.getPostsByDesNWebsiteUseCase
      , this.getPostsByDescNSubCategoryUseCase
      , this.getPostsByDescNSubCategoryNWebsiteUseCase
      , this.getPostsByDescNCategoryUseCase
      , this.getPostsByDescNCategoryNWebsiteUseCase
      , this.getPostsByDescNCategoryNSubCategoryUseCase
      , this.getPostsByDescNCategoryNSubCategoryNWebsiteUseCase
      , this.getPostsByCategoryUseCase
      , this.getPostsByCategoryNWebsiteUseCase
      , this.getPostsByCategoryNSubCategoryUseCase
      , this.getPostsByCategoryNSubCategoryNWebsiteUseCase
      )
      : super(const HomeState()) {
    on<GetAllPostsEvent>(_getAllPosts);
    on<GetPostsByWebsiteEvent>(_getPostsByWebsiteEvent);
    on<GetPostsBySubCategoryEvent>(_searchForTest);
    on<GetPostsBySubCategoryNWebsiteEvent>(_searchForTest);
    on<GetPostsByDescEvent>(_searchForTest);
    on<GetPostsByDesNWebsiteEvent>(_searchForTest);
    on<GetPostsByDescNSubCategoryEvent>(_searchForTest);
    on<GetPostsByDescNSubCategoryNWebsiteEvent>(_searchForTest);
    on<GetPostsByDescNCategoryEvent>(_searchForTest);
    on<GetPostsByDescNCategoryNWebsiteEvent>(_searchForTest);
    on<GetPostsByDescNCategoryNSubCategoryEvent>(_searchForTest);
    on<GetPostsByDescNCategoryNSubCategoryNWebsiteEvent>(_searchForTest);
    on<GetPostsByCategoryEvent>(_searchForTest);
    on<GetPostsByCategoryNWebsiteEvent>(_searchForTest);
    on<GetPostsByCategoryNSubCategoryEvent>(_searchForTest);
    on<GetPostsByCategoryNSubCategoryNWebsiteEvent>(_searchForTest);
  }

  FutureOr<void> _getAllPosts(
      GetAllPostsEvent event, Emitter<HomeState> emit) async {
    final result = await getAllPostsUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByWebsiteEvent(
      GetPostsByWebsiteEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsByWebsiteUseCase(event.postsByWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _searchForTest(
      SearchTestEvent event, Emitter<HomeState> emit) async {
    final result = await getPostsWithParameterUseCase(event.searchTitle);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }
}