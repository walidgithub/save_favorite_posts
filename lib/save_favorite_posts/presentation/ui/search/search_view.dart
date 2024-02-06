import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui_components/dividers/custom_dotted_divider.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../../../domain/reposnses/favorite_posts_response.dart';
import '../../../shared/constant/strings_manager.dart';
import '../../ui_components/buttons/custom_icon_button.dart';
import '../../ui_components/texts/heading_rich_text.dart';
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

  int currentPage = 0;
  int totalPages = 10;
  List<int> middlePages = [];

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
    _searchController.addListener(_onSearch);
    if (totalPages != 0) {
      currentPage = 1;
      middlePages = [];

      if (totalPages >= 5) {
        middlePages = [
          currentPage + 1,
          currentPage + 2,
          currentPage + 3
        ];
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
              SizedBox(height: AppConstants.smallHeightBetweenElements,),
              DottedDivider(
                color: ColorManager.kLine2,
                thickness: 1.0,
                dashLength: 3.w,
                dashSpacing: 2.w,
              ),
              SizedBox(height: AppConstants.smallHeightBetweenElements,),
              SizedBox(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  child: PaginationView(totalPages: totalPages,middlePages: middlePages,))
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBody() {
    return SingleChildScrollView(
      child: postsResponse.isNotEmpty ?
      AnimationLimiter(
        child: ListView.separated(
          itemCount: postsResponse.length,
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
                    postsResponse: postsResponse[index],
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
