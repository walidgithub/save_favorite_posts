import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/posts_by_desc_n_category_n_subcategory_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui_components/dialogs/loading_dialog.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui_components/dividers/custom_dotted_divider.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../../data/models/posts_model.dart';
import '../../../domain/entities/search_filter.dart';
import '../../../domain/reposnses/posts_response.dart';
import '../../../domain/requests/posts_by_category_n_subcategory_n_website_request.dart';
import '../../../domain/requests/posts_by_category_n_website_request.dart';
import '../../../domain/requests/posts_by_category_request.dart';
import '../../../domain/requests/posts_by_desc_n_category_n_website_request.dart';
import '../../../domain/requests/posts_by_desc_n_category_request.dart';
import '../../../domain/requests/posts_by_desc_n_subcategory_n_website_request.dart';
import '../../../domain/requests/posts_by_desc_n_subcategory_request.dart';
import '../../../domain/requests/posts_by_desc_n_website_request.dart';
import '../../../domain/requests/posts_by_desc_request.dart';
import '../../../domain/requests/posts_by_subcategory_n_website_request.dart';
import '../../../domain/requests/posts_by_subcategory_request.dart';
import '../../../domain/requests/posts_by_website_request.dart';
import '../../../shared/constant/strings_manager.dart';
import '../../di/di.dart';
import '../../ui_components/buttons/custom_icon_button.dart';
import '../../ui_components/texts/heading_rich_text.dart';
import '../bloc/search/search_bloc.dart';
import 'components/filter_sheet.dart';
import 'components/pagination.dart';
import 'components/search_field.dart';
import 'components/search_result_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  SearchEvent searchEvent = InitialEvent();

  int currentPage = 0;
  int totalPages = 0;

  int getPagesCount() {
    double pagesTotal = postsModel.length / 10;
    return pagesTotal.floor();
  }

  List<int> middlePages = [];

  @override
  void initState() {
    super.initState();
    totalPages = getPagesCount();
    _searchFocusNode.addListener(_onFocusChange);
    if (totalPages != 0) {
      currentPage = 1;
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
  }

  @override
  void dispose() {
    _searchFocusNode.removeListener(_onFocusChange);
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _onSearch() {
    setState(() {
      String searchText = _searchController.text;
      if (_searchFocusNode.hasFocus && searchText.isNotEmpty) {
        searchFilter[0].searchText = _searchController.text;
        getMatchingEvent();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<SearchBloc>()..add(searchEvent),
          child: Padding(
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
                        onSubmit: (v) => _onSearch(),
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
                          builder: (context) {
                            return FilterSheet(
                              search: () {
                                setState(() {
                                  searchFilter[0].searchText =
                                      _searchController.text;
                                  getMatchingEvent();
                                  print(searchEvent);
                                  print('--------------------');
                                  sl<SearchBloc>().add(searchEvent);
                                  Navigator.pop(context);
                                });
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
                SizedBox(height: 30.h),
                Expanded(child: _buildBody()),
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
                                middlePages: middlePages,
                              ))
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<SearchBloc, SearchState>(
  listener: (context, state) {
    if (state.postsState == RequestState.loading) {
      showLoading();
    } else if (state.postsState == RequestState.loaded) {
      hideLoading();
    }
  },
  builder: (context, state) {
    return BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) =>
            previous.postsState != current.postsState,
        builder: (context, state) {
          switch (state.postsState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator(),);
            case RequestState.loaded:
              return SingleChildScrollView(
                child: state.postsList.isNotEmpty
                    ? AnimationLimiter(
                        child: ListView.separated(
                          itemCount: state.postsList.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15.h),
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
                                    postsResponse: state.postsList[index],
                                    removeCallback: () {
                                      // fc.removeFromFavorites(fc.favorite![index]);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(child: Text(AppStrings.noSearchResults)),
              );
              ;
            case RequestState.error:
              return Center(child: Text(state.postsMessage));
          }
        });
  },
);
  }

  getMatchingEvent() {
    String category = searchFilter[0].category!;
    String subCategory = searchFilter[0].subCategory!;
    String website = searchFilter[0].website!;
    String searchText = searchFilter[0].searchText!;

    if (searchText != '' &&
        website != 'None' &&
        subCategory != 'None' &&
        category != 'None') {
      searchEvent = GetAllPostsEvent();
      // search with three fields -------------------------------------
    } else if (searchText != '' &&
        website == 'None' &&
        subCategory != 'None' &&
        category != 'None') {
      searchEvent = GetPostsByDescNCategoryNSubCategoryEvent(
          PostsByDescNCategoryNSubCategoryRequest(
              description: searchText,
              category: category,
              subCategory: subCategory));
    } else if (searchText != '' &&
        website != 'None' &&
        subCategory == 'None' &&
        category != 'None') {
      searchEvent = GetPostsByDescNCategoryNWebsiteEvent(
          PostsByDescNCategoryNWebsiteRequest(
              description: searchText, category: category, website: website));
    } else if (searchText != '' &&
        website != 'None' &&
        subCategory != 'None' &&
        category == 'None') {
      searchEvent = GetPostsByDescNSubCategoryNWebsiteEvent(
          PostsByDescNSubCategoryNWebsiteRequest(
              subCategory: subCategory,
              description: searchText,
              website: website));
    } else if (searchText == '' &&
        website != 'None' &&
        subCategory != 'None' &&
        category != 'None') {
      searchEvent = GetPostsByCategoryNSubCategoryNWebsiteEvent(
          PostsByCategoryNSubCategoryNWebsiteRequest(
              website: website, subCategory: subCategory, category: category));
      // search with two fields ----------------------------------------
    } else if (searchText != '' &&
        website == 'None' &&
        subCategory == 'None' &&
        category != 'None') {
      searchEvent = GetPostsByDescNCategoryEvent(PostsByDescNCategoryRequest(
          category: category, description: searchText));
    } else if (searchText != '' &&
        website == 'None' &&
        subCategory != 'None' &&
        category == 'None') {
      searchEvent = GetPostsByDescNSubCategoryEvent(
          PostsByDescNSubCategoryRequest(
              description: searchText, subCategory: subCategory));
    } else if (searchText != '' &&
        website != 'None' &&
        subCategory == 'None' &&
        category == 'None') {
      searchEvent = GetPostsByDescNWebsiteEvent(PostsByDescNWebsiteRequest(
          description: searchText, website: website));
    } else if (searchText == '' &&
        website == 'None' &&
        subCategory != 'None' &&
        category != 'None') {
      searchEvent = GetPostsByDescNWebsiteEvent(PostsByDescNWebsiteRequest(
          description: searchText, website: website));
    } else if (searchText == '' &&
        website != 'None' &&
        subCategory == 'None' &&
        category != 'None') {
      searchEvent = GetPostsByCategoryNWebsiteEvent(
          PostsByCategoryNWebsiteRequest(website: website, category: category));
    } else if (searchText == '' &&
        website != 'None' &&
        subCategory != 'None' &&
        category == 'None') {
      searchEvent = GetPostsBySubCategoryNWebsiteEvent(
          PostsBySubCategoryNWebsiteRequest(
              website: website, subCategory: subCategory));
      // search with one field ----------------------------------------
    } else if (searchText != '' &&
        website == 'None' &&
        subCategory == 'None' &&
        category == 'None') {
      searchEvent =
          GetPostsByDescEvent(PostsByDescRequest(description: searchText));
    } else if (searchText == '' &&
        website != 'None' &&
        subCategory == 'None' &&
        category == 'None') {
      searchEvent =
          GetPostsByWebsiteEvent(PostsByWebsiteRequest(website: website));
    } else if (searchText == '' &&
        website == 'None' &&
        subCategory == 'None' &&
        category != 'None') {
      searchEvent =
          GetPostsByCategoryEvent(PostsByCategoryRequest(category: category));
    } else if (searchText == '' &&
        website == 'None' &&
        subCategory != 'None' &&
        category == 'None') {
      searchEvent = GetPostsBySubCategoryEvent(
          PostsBySubCategoryRequest(subCategory: subCategory));
    }
    totalPages = getPagesCount();
  }
}
