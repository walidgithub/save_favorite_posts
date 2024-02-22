import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_categories_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_subcategories_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/usecases/search/get_all_websites_usecase.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/cubit/post/post_state.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/requests/iud/delete_post_request.dart';
import '../../../../domain/requests/iud/insert_post_request.dart';
import '../../../../domain/requests/iud/update_post_request.dart';
import '../../../../domain/usecases/base_usecase/base_usecase.dart';
import '../../../../domain/usecases/iud/delete_post_usecase.dart';
import '../../../../domain/usecases/iud/insert_new_post_usecase.dart';
import '../../../../domain/usecases/iud/update_post_usecase.dart';

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
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
        postState: RequestState.loading, postMessage: '', categoryList: []));

    final result = await getAllCategoriesUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            postState: RequestState.error, postMessage: l.message)),
            (r) => emit(state.copyWith(
          categoryList: r,
          postState: RequestState.loaded,
        )));
  }

  FutureOr<void> getAllSubCategories() async {
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
        postState: RequestState.loading, postMessage: '', subCategoryList: []));

    final result = await getAllSubCategoriesUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            postState: RequestState.error, postMessage: l.message)),
            (r) => emit(state.copyWith(
              subCategoryList: r,
          postState: RequestState.loaded,
        )));
  }

  FutureOr<void> getAllWebsites() async {
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
        postState: RequestState.loading, postMessage: '', websiteList: []));

    final result = await getAllWebsitesUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            postState: RequestState.error, postMessage: l.message)),
            (r) => emit(state.copyWith(
              websiteList: r,
          postState: RequestState.loaded,
        )));
  }

  FutureOr<void> insertPost(InsertPostRequest insertPostRequest) async {
    emit(state.copyWith(
        postState: RequestState.loading, postMessage: '', postId: 0));

    await Future.delayed(const Duration(seconds: 2));

    final result = await insertPostUseCase(insertPostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.error, postMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postState: RequestState.loaded,
            )));
  }

  FutureOr<void> updatePost(UpdatePostRequest updatePostRequest) async {
    emit(state.copyWith(
        postState: RequestState.loading, postMessage: '', postId: 0));

    await Future.delayed(const Duration(seconds: 2));

    final result = await updatePostUseCase(updatePostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.error, postMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postState: RequestState.loaded,
            )));
  }

  FutureOr<void> deletePost(DeletePostRequest deletePostRequest) async {
    emit(state.copyWith(
        postState: RequestState.loading, postMessage: '', postId: 0));

    await Future.delayed(const Duration(seconds: 2));

    final result = await deletePostUseCase(deletePostRequest);

    result.fold(
        (l) => emit(state.copyWith(
            postState: RequestState.error, postMessage: l.message)),
        (r) => emit(state.copyWith(
              postId: r,
              postState: RequestState.loaded,
            )));
  }
}
