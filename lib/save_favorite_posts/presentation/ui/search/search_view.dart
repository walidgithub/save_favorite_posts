import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../../../domain/reposnses/search_results_response.dart';
import '../../../shared/constant/strings_manager.dart';
import '../../ui_components/buttons/custom_icon_button.dart';
import '../../ui_components/texts/heading_rich_text.dart';
import 'components/filter_sheet.dart';
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
  var _currentPage = 1;
  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
    _searchController.addListener(_onSearch);
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
    String searchText = _searchController.text;
    if (_searchFocusNode.hasFocus && searchText.isNotEmpty) {

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const HeadingRichText(
                text1: 'You can\n',
                text2: 'Search for posts',
              ),
              SizedBox(height: 28.h),
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      onChange: (v) => _onSearch(),
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
                          return const FilterSheet();
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
              NumberPaginator(
                numberPages: searchResultResponse.length,
                initialPage: 1,
                config: NumberPaginatorUIConfig(
                  buttonSelectedBackgroundColor: ColorManager.kPrimary,
                  buttonUnselectedForegroundColor: ColorManager.kPrimary,
                ),
                onPageChange: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBody() {
    return SingleChildScrollView(
      child: searchResultResponse.isNotEmpty ?
      AnimationLimiter(
        child: ListView.separated(
          itemCount: searchResultResponse.length,
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
                    index:index,
                    searchResultResponse: searchResultResponse[index],
                    removeCallback: () {
                      // fc.removeFromFavorites(fc.favorite![index]);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ) : const Center(child: Text(AppStrings.noSearchResults)),
    );
  }

}
