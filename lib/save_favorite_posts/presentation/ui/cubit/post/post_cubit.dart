import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/search/get_post_by_id_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_categories_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_subcategories_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_websites_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_post_by_id_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/cubit/post/post_state.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/requests/iud/delete_post_request.dart';
import '../../../../domain/requests/iud/insert_post_request.dart';
import '../../../../domain/requests/iud/update_post_request.dart';
import '../../../../domain/usecases/base_usecase/base_usecase.dart';
import '../../../../domain/usecases/iud/delete_post_usecase.dart';
import '../../../../domain/usecases/iud/insert_new_post_usecase.dart';
import '../../../../domain/usecases/iud/update_post_usecase.dart';
import '../../../../domain/usecases/search/get_post_by_id_usecase.dart';

class PostCubit extends Cubit<PostState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetAllSubCategoriesUseCase getAllSubCategoriesUseCase;
  final GetAllWebsitesUseCase getAllWebsitesUseCase;
  final InsertPostUseCase insertPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;

  PostCubit(
    this.getAllCategoriesUseCase,
    this.getAllSubCategoriesUseCase,
    this.getAllWebsitesUseCase,
    this.insertPostUseCase,
    this.updatePostUseCase,
    this.deletePostUseCase,
  ) : super(const PostState());

  static PostCubit get(context) => BlocProvider.of(context);

  FutureOr<void> getAllCategories() async {
    emit(state.copyWith(
        postState: RequestState.categoryLoading,
        postMessage: '',
        categoryList: []));

    final result = await getAllCategoriesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.categoryError, postMessage: l.message)),
        (r) => emit(state.copyWith(
              categoryList: r,
              postState: RequestState.categoryLoaded,
            )));
  }

  FutureOr<void> getAllSubCategories() async {
    emit(state.copyWith(
        postState: RequestState.subCategoryLoading,
        postMessage: '',
        subCategoryList: []));

    final result = await getAllSubCategoriesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.subCategoryError, postMessage: l.message)),
        (r) => emit(state.copyWith(
              subCategoryList: r,
              postState: RequestState.subCategoryLoaded,
            )));
  }

  FutureOr<void> getAllWebsites() async {
    emit(state.copyWith(
        postState: RequestState.webSiteLoading,
        postMessage: '',
        websiteList: []));

    final result = await getAllWebsitesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.webSiteError, postMessage: l.message)),
        (r) => emit(state.copyWith(
              websiteList: r,
              postState: RequestState.webSiteLoaded,
            )));
  }

  FutureOr<void> insertPost(InsertPostRequest insertPostRequest) async {
    emit(state.copyWith(
        postState: RequestState.insertLoading, postMessage: '', postId: 0));

    final result = await insertPostUseCase(insertPostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.insertError, postMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postState: RequestState.insertDone,
            )));
  }

  FutureOr<void> updatePost(UpdatePostRequest updatePostRequest) async {
    emit(state.copyWith(
        postState: RequestState.updateLoading, postMessage: '', postId: 0));

    final result = await updatePostUseCase(updatePostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.insertError, postMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postState: RequestState.insertDone,
            )));
  }

  FutureOr<void> deletePost(DeletePostRequest deletePostRequest) async {
    emit(state.copyWith(
        postState: RequestState.deleteLoading, postMessage: '', postId: 0));

    final result = await deletePostUseCase(deletePostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.deleteError, postMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postState: RequestState.deleteDone,
            )));
  }
}
