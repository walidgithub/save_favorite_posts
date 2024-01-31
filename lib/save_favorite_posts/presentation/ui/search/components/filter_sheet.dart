import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../ui_components/buttons/primary_button.dart';
import 'category_chip.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int selectedWebsite = 0;
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
                websiteResponse.length,
                    (index) => CategoryChip(
                    onTap: () {
                      selectedWebsite = index;
                      setState(() {});
                    },
                    text: websiteResponse[index].title,
                    isSelected: selectedWebsite == index)),
          ),
          SizedBox(height: 20.h),
          Text('Categories', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              runSpacing: 10.w,
              spacing: 10.w,
              children: List.generate(
                  categoryResponse.length,
                      (index) => CategoryChip(
                      onTap: () {
                        selectedCategory = index;
                        setState(() {});
                      },
                      text: categoryResponse[index].title,
                      isSelected: selectedCategory == index)),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Sub Category', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          Wrap(
            runSpacing: 10.w,
            spacing: 10.w,
            children: List.generate(
                subCategoryResponse.length,
                (index) => CategoryChip(
                    onTap: () {
                      selectedSubCategory = index;
                      setState(() {});
                    },
                    text: subCategoryResponse[index].title,
                    isSelected: selectedSubCategory == index)),
          ),
          SizedBox(height: 50.h),
          PrimaryButton(
            onTap: () {

            },
            text: 'Filter',
          ),
          SizedBox(height: 20.h),
        ],
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