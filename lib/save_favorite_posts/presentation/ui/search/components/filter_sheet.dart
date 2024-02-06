import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
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
  final ScrollController _webScrollController = ScrollController();
  final ScrollController _categoryScrollController = ScrollController();
  final ScrollController _subCategoryScrollController = ScrollController();

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
            child: Text(AppStrings.filters,
                style: AppTypography.kBold24
                    .copyWith(color: ColorManager.kSecondary)),
          ),
          SizedBox(height: 13.h),
          Text(AppStrings.websites, style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          SizedBox(
            height: 100.h,
            width: MediaQuery.sizeOf(context).width,
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 2.w,
              controller: _webScrollController,
              child: SingleChildScrollView(
                controller: _webScrollController,
                child: Wrap(
                  runSpacing: 5.w,
                  spacing: 10.h,
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
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(AppStrings.categories, style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          SizedBox(
            height: 100.h,
            width: MediaQuery.sizeOf(context).width,
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 2.w,
              controller: _categoryScrollController,
              child: SingleChildScrollView(
                controller: _categoryScrollController,
                child: Wrap(
                  runSpacing: 5.w,
                  spacing: 10.h,
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
            ),
          ),
          SizedBox(height: 20.h),
          Text(AppStrings.subCategories, style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          SizedBox(
            height: 100.h,
            width: MediaQuery.sizeOf(context).width,
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 2.w,
              controller: _subCategoryScrollController,
              child: SingleChildScrollView(
                controller: _subCategoryScrollController,
                child: Wrap(
                  runSpacing: 5.w,
                  spacing: 10.h,
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
              ),
            ),
          ),
          SizedBox(height: 30.h),
          PrimaryButton(
            onTap: () {},
            text: AppStrings.filter,
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
            borderRadius: BorderRadius.circular(30.r),
            color: ColorManager.kWhite),
      ),
    );
  }
}
