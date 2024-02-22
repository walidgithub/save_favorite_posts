import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/reposnses/category_response.dart';
import '../../../../domain/reposnses/filter_response.dart';
import '../../../../domain/reposnses/posts_response.dart';
import '../../../../domain/reposnses/sub_category_response.dart';
import '../../../../domain/reposnses/website_response.dart';

class PostState extends Equatable {
  final List<CategoryResponse> categoryList;
  final List<SubCategoryResponse> subCategoryList;
  final List<WebsiteResponse> websiteList;
  final int postId;
  final RequestState postState;
  final String postMessage;

  const PostState({
    this.categoryList = const [],
    this.subCategoryList = const [],
    this.websiteList = const [],
    this.postId = 0,
    this.postState = RequestState.loading,
    this.postMessage = '',
  });

  PostState copyWith({
    List<CategoryResponse>? categoryList,
    List<SubCategoryResponse>? subCategoryList,
    List<WebsiteResponse>? websiteList,
    int? postId,
    RequestState? postState,
    String? postMessage,
  }) {
    return PostState(
      categoryList: categoryList ?? this.categoryList,
      subCategoryList: subCategoryList ?? this.subCategoryList,
      websiteList: websiteList ?? this.websiteList,
      postId: postId ?? this.postId,
      postState: postState ?? this.postState,
      postMessage: postMessage ?? this.postMessage,
    );
  }

  @override
  List<Object?> get props => [categoryList, subCategoryList, websiteList, postId, postState, postMessage];
}