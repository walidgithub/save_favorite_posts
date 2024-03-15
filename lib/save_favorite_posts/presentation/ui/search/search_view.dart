import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:save_favorite_posts/save_favorite_posts/data/models/posts_model.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/delete_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/toggle_seen_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/search/get_all_posts_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui_components/dividers/custom_dotted_divider.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/app_typography.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/functions.dart';
import '../../../domain/entities/search_filter.dart';
import '../../../domain/reposnses/posts_response.dart';
import '../../../domain/requests/search/get_post_by_id_request.dart';
import '../../../domain/requests/search/posts_by_category_n_subcategory_n_website_request.dart';
import '../../../domain/requests/search/posts_by_category_n_website_request.dart';
import '../../../domain/requests/search/posts_by_category_request.dart';
import '../../../domain/requests/search/posts_by_desc_n_category_n_subcategory_request.dart';
import '../../../domain/requests/search/posts_by_desc_n_category_n_website_request.dart';
import '../../../domain/requests/search/posts_by_desc_n_category_request.dart';
import '../../../domain/requests/search/posts_by_desc_n_subcategory_n_website_request.dart';
import '../../../domain/requests/search/posts_by_desc_n_subcategory_request.dart';
import '../../../domain/requests/search/posts_by_desc_n_website_request.dart';
import '../../../domain/requests/search/posts_by_desc_request.dart';
import '../../../domain/requests/search/posts_by_subcategory_n_website_request.dart';
import '../../../domain/requests/search/posts_by_subcategory_request.dart';
import '../../../domain/requests/search/posts_by_website_request.dart';
import '../../../shared/constant/strings_manager.dart';
import '../../ui_components/buttons/custom_icon_button.dart';
import '../../ui_components/dialogs/loading_dialog.dart';
import '../../ui_components/others/custom_animation.dart';
import '../../ui_components/texts/heading_rich_text.dart';
import '../cubit/search/search_cubit.dart';
import '../cubit/search/search_state.dart';
import 'components/custome_pagination.dart';
import 'components/filter_sheet.dart';
import 'components/search_field.dart';
import 'components/search_result_card.dart';
import 'components/shimmer_card.dart';

class SearchView extends StatefulWidget {
  final Function goToEdit;
  final Function goToAddExternal;
  final String externalPostLinkValue;
  const SearchView({required this.goToEdit, required this.goToAddExternal, required this.externalPostLinkValue, Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  bool loading = false;

  int currentPage = 0;
  int totalPages = 0;
  int itemsInPage = 7;
  List<int> middlePages = [];

  int getPagesCount(int listCount) {
    double pagesTotal = listCount / itemsInPage;
    return pagesTotal.ceil();
  }

  List<PostsResponse> postData = [];
  List paginationList = [];
  List<PostsResponse> mainList = [];

  @override
  void initState() {
    super.initState();
    _searchController.text = '';
    searchForPosts(context);
  }

  void searchForPosts(BuildContext context) {
    getMatchingEvent(context);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(BuildContext context) {
    String searchText = _searchController.text;
    if (_searchFocusNode.hasFocus && searchText.isNotEmpty) {
      searchFilter[0].searchText = _searchController.text;
      searchForPosts(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: SafeArea(
          child: bodyContent(context),
        )),
      ),
    );
  }

  Widget bodyContent(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) async {
        if (state.searchState == RequestState.searchLoading) {
          loading = true;
          showLoading();
        } else if (state.searchState == RequestState.searchLoaded) {
          loading = false;
          hideLoading();
          // mainList = state.searchList;
          mainList = postsModel;
          totalPages = getPagesCount(mainList.length);
          if (totalPages != 0) {
            currentPage = 1;
            await SearchCubit.get(context)
                .paginatePages(mainList, currentPage, itemsInPage);
            middlePages = [];

            if (totalPages >= 5) {
              middlePages = [currentPage + 1, currentPage + 2, currentPage + 3];
            } else {
              for (int i = 1; i < totalPages - 1; i++) {
                middlePages.add(i + 1);
              }
            }
          } else {
            currentPage = 0;
            middlePages = [];
          }
        } else if (state.searchState == RequestState.searchError) {
          loading = false;
          hideLoading();
        } else if (state.searchState == RequestState.deleteLoading) {
          loading = true;
          showLoading();
        } else if (state.searchState == RequestState.deleteDone) {
          loading = false;
          hideLoading();
          searchFilter[0].searchText = _searchController.text;
          searchForPosts(context);
        } else if (state.searchState == RequestState.deleteError) {
          loading = false;
          hideLoading();
        } else if (state.searchState == RequestState.postLoading) {
          loading = true;
          showLoading();
        } else if (state.searchState == RequestState.postLoaded) {
          loading = false;
          hideLoading();
          widget.goToEdit(state.searchList, state.postData);
        } else if (state.searchState == RequestState.postError) {
          loading = false;
          hideLoading();
        } else if (state.searchState == RequestState.toggleSeenLoading) {
          loading = true;
          showLoading();
        } else if (state.searchState == RequestState.toggleSeenDone) {
          loading = false;
          hideLoading();
        } else if (state.searchState == RequestState.toggleSeenError) {
          loading = false;
          hideLoading();
        } else if (state.searchState == RequestState.paginateLoading) {
          loading = true;
          showLoading();
        } else if (state.searchState == RequestState.paginateLoaded) {
          loading = false;
          hideLoading();
          paginationList = state.searchList;

          if (widget.externalPostLinkValue != '' && widget.externalPostLinkValue != 'null') {
            widget.goToAddExternal();
          }

        } else if (state.searchState == RequestState.paginateError) {
          loading = false;
          hideLoading();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            headerBody(context),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    loading
                        ? Expanded(child: shimmerBody())
                        : Expanded(child: _searchBody(paginationList)),
                    SizedBox(
                      height: AppConstants.smallHeightBetweenElements,
                    ),
                    totalPages > 1
                        ? Column(
                            children: [
                              DottedDivider(
                                color: ColorManager.kLine2,
                                thickness: 1.0,
                                dashLength: 3.w,
                                dashSpacing: 2.w,
                              ),
                              SizedBox(
                                height: AppConstants.smallHeightBetweenElements,
                              ),
                              SizedBox(
                                  height: 40.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: PaginationView(
                                    totalPages: totalPages,
                                    currentPage: currentPage,
                                    getData: (returnCurrentPage, returnedMiddlePages) async {
                                      currentPage = returnCurrentPage;
                                      middlePages = returnedMiddlePages;
                                      await SearchCubit.get(context)
                                          .paginatePages(mainList, currentPage,
                                          itemsInPage);
                                    },
                                  ))
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget headerBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const HeadingRichText(
            text1: '${AppStrings.youCan}\n',
            text2: AppStrings.searchForPosts,
          ),
          SizedBox(height: 28.h),
          Row(
            children: [
              Expanded(
                child: SearchField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  onSubmit: (v) => _onSearch(context),
                ),
              ),
              SizedBox(width: 10.w),
              CustomIconButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    barrierColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    builder: (context2) {
                      return FilterSheet(
                        search: () {
                          searchFilter[0].searchText = _searchController.text;
                          searchForPosts(context);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                icon: AssetsManager.filter,
                borderCol: ColorManager.kLine,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchBody(searchList) {
    return SingleChildScrollView(
      child: searchList.isNotEmpty
          ? AnimationLimiter(
              child: ListView.separated(
                itemCount: searchList.length,
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: SearchResultView(
                          index: index,
                          goToEdit: () async {
                            await SearchCubit.get(context).getPostById(
                                GetPostByIdRequest(id: searchList[index].id));
                          },
                          toggleSeen: () async {
                            int toggleSeen = 0;
                            if (searchList[index].seen == 1) {
                              toggleSeen = 0;
                            } else {
                              toggleSeen = 1;
                            }
                            await SearchCubit.get(context)
                                .toggleSeenPostUseCase(ToggleSeenPostRequest(
                                    id: searchList[index].id,
                                    seen: toggleSeen));
                            setState(() {});
                          },
                          postsResponse: searchList[index],
                          removeCallback: () async {
                            await SearchCubit.get(context).deletePost(
                                DeletePostRequest(id: searchList[index].id));
                          },
                          shareCallback: () async {
                            Share.shareUri(Uri.parse(searchList[index].link));
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : SizedBox(
              height: 500.h,
              child: FadeAnimation(
                delay: 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.noSearchResults,
                      style: AppTypography.kExtraLight18,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget shimmerBody() {
    return SingleChildScrollView(
      child: AnimationLimiter(
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => SizedBox(height: 15.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: const SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ShimmerCard(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  getMatchingEvent(BuildContext context) async {
    String category = searchFilter[0].category!;
    String subCategory = searchFilter[0].subCategory!;
    String website = searchFilter[0].website!;
    int seen = searchFilter[0].seen!;
    String searchText = searchFilter[0].searchText!;

    if (searchText == '' &&
        website == 'All' &&
        subCategory == 'All' &&
        category == 'All') {
      await SearchCubit.get(context)
          .getAllPosts(GetAllPostsRequest(seen: seen));
    } else if (searchText != '' &&
        website == 'All' &&
        subCategory != 'All' &&
        category != 'All') {
      await SearchCubit.get(context).getPostsByDescNCategoryNSubCategory(
          PostsByDescNCategoryNSubCategoryRequest(
              description: searchText,
              category: category,
              subCategory: subCategory,
              seen: seen));
    } else if (searchText != '' &&
        website != 'All' &&
        subCategory == 'All' &&
        category != 'All') {
      await SearchCubit.get(context).getPostsByDescNCategoryNWebsite(
          PostsByDescNCategoryNWebsiteRequest(
              description: searchText,
              category: category,
              website: website,
              seen: seen));
    } else if (searchText != '' &&
        website != 'All' &&
        subCategory != 'All' &&
        category == 'All') {
      await SearchCubit.get(context).getPostsByDescNSubCategoryNWebsite(
          PostsByDescNSubCategoryNWebsiteRequest(
              subCategory: subCategory,
              description: searchText,
              website: website,
              seen: seen));
    } else if (searchText == '' &&
        website != 'All' &&
        subCategory != 'All' &&
        category != 'All') {
      await SearchCubit.get(context).getPostsByCategoryNSubCategoryNWebsite(
          PostsByCategoryNSubCategoryNWebsiteRequest(
              website: website,
              subCategory: subCategory,
              category: category,
              seen: seen));
      // search with two fields ----------------------------------------
    } else if (searchText != '' &&
        website == 'All' &&
        subCategory == 'All' &&
        category != 'All') {
      await SearchCubit.get(context).getPostsByDescNCategory(
          PostsByDescNCategoryRequest(
              category: category, description: searchText, seen: seen));
    } else if (searchText != '' &&
        website == 'All' &&
        subCategory != 'All' &&
        category == 'All') {
      await SearchCubit.get(context).getPostsByDescNSubCategory(
          PostsByDescNSubCategoryRequest(
              description: searchText, subCategory: subCategory, seen: seen));
    } else if (searchText != '' &&
        website != 'All' &&
        subCategory == 'All' &&
        category == 'All') {
      await SearchCubit.get(context).getPostsByDescNWebsite(
          PostsByDescNWebsiteRequest(
              description: searchText, website: website, seen: seen));
    } else if (searchText == '' &&
        website == 'All' &&
        subCategory != 'All' &&
        category != 'All') {
      await SearchCubit.get(context).getPostsByDescNWebsite(
          PostsByDescNWebsiteRequest(
              description: searchText, website: website, seen: seen));
    } else if (searchText == '' &&
        website != 'All' &&
        subCategory == 'All' &&
        category != 'All') {
      await SearchCubit.get(context).getPostsByCategoryNWebsite(
          PostsByCategoryNWebsiteRequest(
              website: website, category: category, seen: seen));
    } else if (searchText == '' &&
        website != 'All' &&
        subCategory != 'All' &&
        category == 'All') {
      await SearchCubit.get(context).getPostsBySubCategoryNWebsite(
          PostsBySubCategoryNWebsiteRequest(
              website: website, subCategory: subCategory, seen: seen));
      // search with one field ----------------------------------------
    } else if (searchText != '' &&
        website == 'All' &&
        subCategory == 'All' &&
        category == 'All') {
      await SearchCubit.get(context).getPostsByDesc(
          PostsByDescRequest(description: searchText, seen: seen));
    } else if (searchText == '' &&
        website != 'All' &&
        subCategory == 'All' &&
        category == 'All') {
      BlocProvider.of<SearchCubit>(context).getPostsByWebsite(
          PostsByWebsiteRequest(website: website, seen: seen));
    } else if (searchText == '' &&
        website == 'All' &&
        subCategory == 'All' &&
        category != 'All') {
      await SearchCubit.get(context).getPostsByCategory(
          PostsByCategoryRequest(category: category, seen: seen));
    } else if (searchText == '' &&
        website == 'All' &&
        subCategory != 'All' &&
        category == 'All') {
      await SearchCubit.get(context).getPostsBySubCategory(
          PostsBySubCategoryRequest(subCategory: subCategory, seen: seen));
    }
    // totalPages = getPagesCount();
  }
}
