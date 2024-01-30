import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/search/components/search_result_card.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../domain/reposnses/search_results_response.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../ui_components/buttons/primary_button.dart';
import 'category_chip.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int selectedCategory = 0;
  int selectedSubCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: ColorManager.kLightPink,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomDivider(),
          SizedBox(height: 20.h),
          Center(
            child: Text('Filters',
                style: AppTypography.kBold24
                    .copyWith(color: ColorManager.kSecondary)),
          ),
          SizedBox(height: 13.h),
          Text('Websites', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          Wrap(
            runSpacing: 10.w,
            spacing: 10.w,
            children: List.generate(
                categoryResponse.length,
                    (index) => CategoryChip(
                    onTap: () {
                      selectedSubCategory = index;
                      setState(() {});
                    },
                    text: categoryResponse[index].title,
                    isSelected: selectedSubCategory == index)),
          ),
          SizedBox(height: 20.h),
          Text('Categories', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          Wrap(
            runSpacing: 10.w,
            spacing: 10.w,
            children: List.generate(
                subCategoryResponse.length,
                (index) => CategoryChip(
                    onTap: () {
                      selectedCategory = index;
                      setState(() {});
                    },
                    text: subCategoryResponse[index].title,
                    isSelected: selectedCategory == index)),
          ),
          SizedBox(height: 20.h),
          Text('Sub Category', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          Wrap(
            runSpacing: 10.w,
            spacing: 10.w,
            children: List.generate(
                categoryResponse.length,
                (index) => CategoryChip(
                    onTap: () {
                      selectedSubCategory = index;
                      setState(() {});
                    },
                    text: categoryResponse[index].title,
                    isSelected: selectedSubCategory == index)),
          ),
          SizedBox(height: 50.h),
          PrimaryButton(
            onTap: () {

            },
            text: 'Filter',
          ),
          SizedBox(height: 20.h),
          Expanded(child: _buildBody())
        ],
      ),
    );
  }


  Widget _buildBody() {
    return AnimationLimiter(
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
                child: SearchResultCard(
                  searchResultResponse: searchResultResponse[index].category,
                  removeCallback: () {
                    // fc.removeFromFavorites(fc.favorite![index]);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5.h,
        width: 60.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r), color: ColorManager.kWhite),
      ),
    );
  }
}
