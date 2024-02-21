import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/insert_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/update_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/cubit/search/search_state.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../domain/requests/search/posts_by_category_n_subcategory_n_website_request.dart';
import '../../../../domain/requests/search/posts_by_category_n_subcategory_request.dart';
import '../../../../domain/requests/search/posts_by_category_n_website_request.dart';
import '../../../../domain/requests/search/posts_by_category_request.dart';
import '../../../../domain/requests/search/posts_by_desc_n_category_n_subcategory_n_website_request.dart';
import '../../../../domain/requests/search/posts_by_desc_n_category_n_subcategory_request.dart';
import '../../../../domain/requests/search/posts_by_desc_n_category_n_website_request.dart';
import '../../../../domain/requests/search/posts_by_desc_n_category_request.dart';
import '../../../../domain/requests/search/posts_by_desc_n_subcategory_n_website_request.dart';
import '../../../../domain/requests/search/posts_by_desc_n_subcategory_request.dart';
import '../../../../domain/requests/search/posts_by_desc_n_website_request.dart';
import '../../../../domain/requests/search/posts_by_desc_request.dart';
import '../../../../domain/requests/search/posts_by_subcategory_n_website_request.dart';
import '../../../../domain/requests/search/posts_by_subcategory_request.dart';
import '../../../../domain/requests/search/posts_by_website_request.dart';
import '../../../../domain/usecases/base_usecase/base_usecase.dart';
import '../../../../domain/usecases/iud/delete_post_usecase.dart';
import '../../../../domain/usecases/iud/insert_new_post_usecase.dart';
import '../../../../domain/usecases/iud/update_post_usecase.dart';
import '../../../../domain/usecases/search/get_all_posts_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_category_n_subcategory_n_website_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_category_n_subcategory_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_category_n_website_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_category_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_n_category_n_subcategory_n_website_usecases.dart';
import 'package:bloc/bloc.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_n_category_n_subcategory_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_n_category_n_website_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_n_category_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_n_subcategory_n_website_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_n_subcategory_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_n_website_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_desc_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_subcategory_n_website_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_subcategory_usecase.dart';
import '../../../../domain/usecases/search/get_posts_by_website_usecase.dart';

class SearchCubit extends Cubit<SearchState> {
  final InsertPostUseCase insertPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;
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
      this.insertPostUseCase,
      this.updatePostUseCase,
      this.deletePostUseCase,
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

  FutureOr<void> insertPost(InsertPostRequest insertPostRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postId: 0));

    await Future.delayed(const Duration(seconds: 2));

    final result = await insertPostUseCase(insertPostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> updatePost(UpdatePostRequest updatePostRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postId: 0));

    await Future.delayed(const Duration(seconds: 2));

    final result = await updatePostUseCase(updatePostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> deletePost(DeletePostRequest deletePostRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postId: 0));

    await Future.delayed(const Duration(seconds: 2));

    final result = await deletePostUseCase(deletePostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    final result = await getAllPostsUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByWebsite(
      PostsByWebsiteRequest postsByWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

    final result = await getPostsByWebsiteUseCase(postsByWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsBySubCategory(
      PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsBySubCategoryNWebsite(
      PostsBySubCategoryNWebsiteRequest
          postsBySubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

    final result = await getPostsByDescUseCase(postsByDescRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNWebsite(
      PostsByDescNWebsiteRequest postsByDescNWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsByDescNSubCategory(
      PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

    final result =
        await getPostsByDescNSubCategoryUseCase(postsByDescNSubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByDescNSubCategoryNWebsite(
      PostsByDescNSubCategoryNWebsiteRequest
          postsByDescNSubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsByDescNCategory(
      PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsByDescNCategoryNWebsite(
      PostsByDescNCategoryNWebsiteRequest
          postsByDescNCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsByDescNCategoryNSubCategory(
      PostsByDescNCategoryNSubCategoryRequest
          postsByDescNCategoryNSubCategoryRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsByDescNCategoryNSubCategoryNWebsite(
      PostsByDescNCategoryNSubCategoryNWebsiteRequest
          postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsByCategory(
      PostsByCategoryRequest postsByCategoryRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

    final result = await getPostsByCategoryUseCase(postsByCategoryRequest);
    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNWebsite(
      PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

    final result =
        await getPostsByCategoryNWebsiteUseCase(postsByCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postsState: RequestState.error, postsMessage: l.message)),
        (r) => emit(state.copyWith(
              postsList: r,
              postsState: RequestState.loaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNSubCategory(
      PostsByCategoryNSubCategoryRequest
          postsByCategoryNSubCategoryRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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

  FutureOr<void> getPostsByCategoryNSubCategoryNWebsite(
      PostsByCategoryNSubCategoryNWebsiteRequest
          postsByCategoryNSubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        postsState: RequestState.loading, postsMessage: '', postsList: []));

    await Future.delayed(const Duration(seconds: 2));

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
