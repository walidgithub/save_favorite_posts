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
import '../../../../domain/reposnses/posts_response.dart';
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
part 'search_event.dart';
part 'search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
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

  SearchBloc(this.getAllPostsUseCase
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
      : super(const SearchState()) {
    on<GetAllPostsEvent>(_getAllPosts);
    on<GetPostsByWebsiteEvent>(_getPostsByWebsite);
    on<GetPostsBySubCategoryEvent>(_getPostsBySubCategory);
    on<GetPostsBySubCategoryNWebsiteEvent>(_getPostsBySubCategoryNWebsite);
    on<GetPostsByDescEvent>(_getPostsByDesc);
    on<GetPostsByDescNWebsiteEvent>(_getPostsByDesNWebsite);
    on<GetPostsByDescNSubCategoryEvent>(_getPostsByDescNSubCategory);
    on<GetPostsByDescNSubCategoryNWebsiteEvent>(_getPostsByDescNSubCategoryNWebsite);
    on<GetPostsByDescNCategoryEvent>(_getPostsByDescNCategory);
    on<GetPostsByDescNCategoryNWebsiteEvent>(_getPostsByDescNCategoryNWebsite);
    on<GetPostsByDescNCategoryNSubCategoryEvent>(_getPostsByDescNCategoryNSubCategory);
    on<GetPostsByDescNCategoryNSubCategoryNWebsiteEvent>(_getPostsByDescNCategoryNSubCategoryNWebsite);
    on<GetPostsByCategoryEvent>(_getPostsByCategory);
    on<GetPostsByCategoryNWebsiteEvent>(_getPostsByCategoryNWebsite);
    on<GetPostsByCategoryNSubCategoryEvent>(_getPostsByCategoryNSubCategory);
    on<GetPostsByCategoryNSubCategoryNWebsiteEvent>(_getPostsByCategoryNSubCategoryNWebsite);
  }

  FutureOr<void> _getAllPosts(
      GetAllPostsEvent event, Emitter<SearchState> emit) async {
    final result = await getAllPostsUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByWebsite(
      GetPostsByWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByWebsiteUseCase(event.postsByWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsBySubCategory(
      GetPostsBySubCategoryEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsBySubCategoryUseCase(event.postsBySubCategoryRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsBySubCategoryNWebsite(
      GetPostsBySubCategoryNWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsBySubCategoryNWebsiteUseCase(event.postsBySubCategoryNWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDesc(
      GetPostsByDescEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDescUseCase(event.postsByDescRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDesNWebsite(
      GetPostsByDescNWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDesNWebsiteUseCase(event.postsByDescNWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDescNSubCategory(
   GetPostsByDescNSubCategoryEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDescNSubCategoryUseCase(event.postsByDescNSubCategoryRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDescNSubCategoryNWebsite(
      GetPostsByDescNSubCategoryNWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDescNSubCategoryNWebsiteUseCase(event.postsByDescNSubCategoryNWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDescNCategory(
      GetPostsByDescNCategoryEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDescNCategoryUseCase(event.postsByDescNCategoryRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDescNCategoryNWebsite(
      GetPostsByDescNCategoryNWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDescNCategoryNWebsiteUseCase(event.postsByDescNCategoryNWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDescNCategoryNSubCategory(
      GetPostsByDescNCategoryNSubCategoryEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDescNCategoryNSubCategoryUseCase(event.postsByDescNCategoryNSubCategoryRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByDescNCategoryNSubCategoryNWebsite(
      GetPostsByDescNCategoryNSubCategoryNWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByDescNCategoryNSubCategoryNWebsiteUseCase(event.postsByDescNCategoryNSubCategoryNWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByCategory(
      GetPostsByCategoryEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByCategoryUseCase(event.postsByCategoryRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByCategoryNWebsite(
      GetPostsByCategoryNWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByCategoryNWebsiteUseCase(event.postsByCategoryNWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByCategoryNSubCategory(
      GetPostsByCategoryNSubCategoryEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByCategoryNSubCategoryUseCase(event.postsByCategoryNSubCategoryRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPostsByCategoryNSubCategoryNWebsite(
      GetPostsByCategoryNSubCategoryNWebsiteEvent event, Emitter<SearchState> emit) async {
    final result = await getPostsByCategoryNSubCategoryNWebsiteUseCase(event.postsByCategoryNSubCategoryNWebsiteRequest);

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }
}