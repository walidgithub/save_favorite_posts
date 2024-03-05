import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/toggle_seen_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/iud/toggle_seen_post_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/cubit/search/search_state.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/posts_response.dart';
import '../../../../domain/requests/search/get_all_posts_request.dart';
import '../../../../domain/requests/search/get_post_by_id_request.dart';
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
import '../../../../domain/usecases/search/get_all_posts_usecase.dart';
import '../../../../domain/usecases/search/get_post_by_id_usecase.dart';
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
  final ToggleSeenPostUseCase toggleSeenPostUseCase;
  final GetPostByIdUseCase getPostByIdUseCase;
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
  final DeletePostUseCase deletePostUseCase;

  SearchCubit(
    this.toggleSeenPostUseCase,
    this.getPostByIdUseCase,
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
    this.getPostsByCategoryNSubCategoryNWebsiteUseCase,
    this.deletePostUseCase,
  ) : super(const SearchState());

  static SearchCubit get(context) => BlocProvider.of(context);

  FutureOr<void> getAllPosts(GetAllPostsRequest getAllPostsRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getAllPostsUseCase(getAllPostsRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByWebsite(
      PostsByWebsiteRequest postsByWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByWebsiteUseCase(postsByWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsBySubCategory(
      PostsBySubCategoryRequest postsBySubCategoryRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result =
        await getPostsBySubCategoryUseCase(postsBySubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsBySubCategoryNWebsite(
      PostsBySubCategoryNWebsiteRequest
          postsBySubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsBySubCategoryNWebsiteUseCase(
        postsBySubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDesc(PostsByDescRequest postsByDescRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByDescUseCase(postsByDescRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDescNWebsite(
      PostsByDescNWebsiteRequest postsByDescNWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result =
        await getPostsByDescNWebsiteUseCase(postsByDescNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDescNSubCategory(
      PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result =
        await getPostsByDescNSubCategoryUseCase(postsByDescNSubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDescNSubCategoryNWebsite(
      PostsByDescNSubCategoryNWebsiteRequest
          postsByDescNSubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByDescNSubCategoryNWebsiteUseCase(
        postsByDescNSubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategory(
      PostsByDescNCategoryRequest postsByDescNCategoryRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result =
        await getPostsByDescNCategoryUseCase(postsByDescNCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategoryNWebsite(
      PostsByDescNCategoryNWebsiteRequest
          postsByDescNCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByDescNCategoryNWebsiteUseCase(
        postsByDescNCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategoryNSubCategory(
      PostsByDescNCategoryNSubCategoryRequest
          postsByDescNCategoryNSubCategoryRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByDescNCategoryNSubCategoryUseCase(
        postsByDescNCategoryNSubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByDescNCategoryNSubCategoryNWebsite(
      PostsByDescNCategoryNSubCategoryNWebsiteRequest
          postsByDescNCategoryNSubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByDescNCategoryNSubCategoryNWebsiteUseCase(
        postsByDescNCategoryNSubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByCategory(
      PostsByCategoryRequest postsByCategoryRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByCategoryUseCase(postsByCategoryRequest);
    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNWebsite(
      PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result =
        await getPostsByCategoryNWebsiteUseCase(postsByCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNSubCategory(
      PostsByCategoryNSubCategoryRequest
          postsByCategoryNSubCategoryRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByCategoryNSubCategoryUseCase(
        postsByCategoryNSubCategoryRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostsByCategoryNSubCategoryNWebsite(
      PostsByCategoryNSubCategoryNWebsiteRequest
          postsByCategoryNSubCategoryNWebsiteRequest) async {
    emit(state.copyWith(
        searchState: RequestState.searchLoading,
        searchMessage: '',
        searchList: []));

    final result = await getPostsByCategoryNSubCategoryNWebsiteUseCase(
        postsByCategoryNSubCategoryNWebsiteRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.searchError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              searchList: r,
              searchState: RequestState.searchLoaded,
            )));
  }

  FutureOr<void> getPostById(GetPostByIdRequest getPostByIdRequest) async {
    emit(state.copyWith(
        searchState: RequestState.postLoading,
        searchMessage: '',
        postData: []));

    final result = await getPostByIdUseCase(getPostByIdRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.postError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              postData: r,
              searchState: RequestState.postLoaded,
            )));
  }

  FutureOr<void> deletePost(DeletePostRequest deletePostRequest) async {
    emit(state.copyWith(
        searchState: RequestState.deleteLoading, searchMessage: '', postId: 0));

    final result = await deletePostUseCase(deletePostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            searchState: RequestState.deleteError, searchMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              searchState: RequestState.deleteDone,
            )));
  }

  FutureOr<void> toggleSeenPost(ToggleSeenPostRequest toggleSeenPostRequest) async {
    emit(state.copyWith(
        searchState: RequestState.toggleSeenLoading, searchMessage: '', postId: 0));

    final result = await toggleSeenPostUseCase(toggleSeenPostRequest);

    result.fold(
            (l) => emit(state.copyWith(
                searchState: RequestState.toggleSeenError, searchMessage: l.message)),
            (r) => emit(state.copyWith(
          postId: r,
              searchState: RequestState.toggleSeenDone,
        )));
  }

  Future<void> paginatePages(List<PostsResponse> comingList, int currentPage, int itemsInPage) async {
    emit(state.copyWith(
        searchState: RequestState.paginateLoading, searchMessage: '', searchList: []));

    try {
      List<PostsResponse> newList = [];
      int startIndex = currentPage == 0 ? 0 : (currentPage - 1) * itemsInPage;
      int endIndex = currentPage * itemsInPage;
      newList = comingList.sublist(startIndex, endIndex);

      emit(state.copyWith(
        searchList: newList,
        searchState: RequestState.paginateLoaded,
      ));
    } catch (e) {
      emit(state.copyWith(
                  searchState: RequestState.paginateError, searchMessage: 'error when paginate'));
    }
  }
}
