import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_favorite_posts/save_favorite_posts/data/models/posts_model.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/posts_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/cubit/search/search_state.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../domain/requests/posts_by_category_n_subcategory_n_website_request.dart';
import '../../../../domain/requests/posts_by_category_n_subcategory_request.dart';
import '../../../../domain/requests/posts_by_category_n_website_request.dart';
import '../../../../domain/requests/posts_by_category_request.dart';
import '../../../../domain/requests/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../../../../domain/requests/posts_by_desc_n_category_n_subcategory_request.dart';
import '../../../../domain/requests/posts_by_desc_n_category_n_website_request.dart';
import '../../../../domain/requests/posts_by_desc_n_category_request.dart';
import '../../../../domain/requests/posts_by_desc_n_subcategory_n_website_request.dart';
import '../../../../domain/requests/posts_by_desc_n_subcategory_request.dart';
import '../../../../domain/requests/posts_by_desc_n_website_request.dart';
import '../../../../domain/requests/posts_by_desc_request.dart';
import '../../../../domain/requests/posts_by_subcategory_n_website_request.dart';
import '../../../../domain/requests/posts_by_subcategory_request.dart';
import '../../../../domain/requests/posts_by_website_request.dart';
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
import '../../../../domain/usecases/get_posts_by_desc_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_desc_usecase.dart';
import '../../../../domain/usecases/get_posts_by_subcategory_n_website_usecase.dart';
import '../../../../domain/usecases/get_posts_by_subcategory_usecase.dart';
import '../../../../domain/usecases/get_posts_by_website_usecase.dart';

class SearchCubit extends Cubit<SearchState> {
  
  final GetAllPostsUseCase getAllPostsUseCase;
  final GetPostsByWebsiteUseCase getPostsByWebsiteUseCase;
  final GetPostsBySubCategoryUseCase getPostsBySubCategoryUseCase;
  final GetPostsBySubCategoryNWebsiteUseCase
      getPostsBySubCategoryNWebsiteUseCase;
  final GetPostsByDescUseCase getPostsByDescUseCase;
  final GetPostsByDescNWebsiteUseCase getPostsByDescNWebsiteUseCase;
  final GetPostsByDescNSubCategoryUseCase getPostsByDescNSubCategoryUseCase;
  final GetPostsByDescNSubCategoryNWebsiteUseCase
      getPostsByDescNSubCategoryNWebsiteUseCase;
  final GetPostsByDescNCategoryUseCase getPostsByDescNCategoryUseCase;
  final GetPostsByDescNCategoryNWebsiteUseCase
      getPostsByDescNCategoryNWebsiteUseCase;
  final GetPostsByDescNCategoryNSubCategoryUseCase
      getPostsByDescNCategoryNSubCategoryUseCase;
  final GetPostsByDescNCategoryNSubCategoryNWebsiteUseCase
      getPostsByDescNCategoryNSubCategoryNWebsiteUseCase;
  final GetPostsByCategoryUseCase getPostsByCategoryUseCase;
  final GetPostsByCategoryNWebsiteUseCase getPostsByCategoryNWebsiteUseCase;
  final GetPostsByCategoryNSubCategoryUseCase
      getPostsByCategoryNSubCategoryUseCase;
  final GetPostsByCategoryNSubCategoryNWebsiteUseCase
      getPostsByCategoryNSubCategoryNWebsiteUseCase;

  SearchCubit(
      this.getAllPostsUseCase,
      this.getPostsByWebsiteUseCase,
      this.getPostsBySubCategoryUseCase,
      this.getPostsBySubCategoryNWebsiteUseCase,
      this.getPostsByDescUseCase,
      this.getPostsByDescNWebsiteUseCase,
      this.getPostsByDescNSubCategoryUseCase,
      this.getPostsByDescNSubCategoryNWebsiteUseCase,
      this.getPostsByDescNCategoryUseCase,
      this.getPostsByDescNCategoryNWebsiteUseCase,
      this.getPostsByDescNCategoryNSubCategoryUseCase,
      this.getPostsByDescNCategoryNSubCategoryNWebsiteUseCase,
      this.getPostsByCategoryUseCase,
      this.getPostsByCategoryNWebsiteUseCase,
      this.getPostsByCategoryNSubCategoryUseCase,
      this.getPostsByCategoryNSubCategoryNWebsiteUseCase)
      : super(const SearchState());

  static SearchCubit get(context) => BlocProvider.of(context);

  FutureOr<void> getAllPosts() async {

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '',postsList: []));

    final result = await getAllPostsUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
            (r) => emit(state.copyWith(
          postsList: r,
          postsState: RequestState.loaded,
        )));
  }

  FutureOr<void> getPostsByWebsite(PostsByWebsiteRequest postsByWebsiteRequest) async {
    final result = await getPostsByWebsiteUseCase(postsByWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsBySubCategory(PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    final result =
        await getPostsBySubCategoryUseCase(postsBySubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsBySubCategoryNWebsite(PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest) async {
    final result = await getPostsBySubCategoryNWebsiteUseCase(
        postsBySubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDesc(PostsByDescRequest postsByDescRequest) async {
    final result = await getPostsByDescUseCase(postsByDescRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNWebsite(PostsByDescNWebsiteRequest postsByDescNWebsiteRequest) async {
    final result =
        await getPostsByDescNWebsiteUseCase(postsByDescNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNSubCategory(PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    final result = await getPostsByDescNSubCategoryUseCase(
        postsByDescNSubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNSubCategoryNWebsite(PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest) async {
    final result = await getPostsByDescNSubCategoryNWebsiteUseCase(
        postsByDescNSubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategory(PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    final result =
        await getPostsByDescNCategoryUseCase(postsByDescNCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategoryNWebsite(PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest) async {
    final result = await getPostsByDescNCategoryNWebsiteUseCase(
        postsByDescNCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategoryNSubCategory(PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest) async {
    final result = await getPostsByDescNCategoryNSubCategoryUseCase(
        postsByDescNCategoryNSubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategoryNSubCategoryNWebsite(PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    final result = await getPostsByDescNCategoryNSubCategoryNWebsiteUseCase(
        postsByDescNCategoryNSubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByCategory(PostsByCategoryRequest postsByCategoryRequest) async {

    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '',postsList: []));

    await Future.delayed(const Duration(seconds: 2));

    final result =
        await getPostsByCategoryUseCase(postsByCategoryRequest);
    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNWebsite(PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    final result = await getPostsByCategoryNWebsiteUseCase(
        postsByCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNSubCategory(PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest) async {
    final result = await getPostsByCategoryNSubCategoryUseCase(
        postsByCategoryNSubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNSubCategoryNWebsite(PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest) async {
    final result = await getPostsByCategoryNSubCategoryNWebsiteUseCase(
        postsByCategoryNSubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }
}
