import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/models/sub_category_model.dart';
import '../../../../data/models/website_model.dart';
import '../../../../domain/entities/search_filter.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../di/di.dart';
import '../../../ui_components/buttons/primary_button.dart';
import '../../../ui_components/dialogs/loading_dialog.dart';
import '../../cubit/post/post_cubit.dart';
import '../../cubit/post/post_state.dart';
import 'category_chip.dart';

class FilterSheet extends StatefulWidget {
  Function search;
  FilterSheet({required this.search, super.key});

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

  bool hideSeen = false;

  @override
  void initState() {
    categoryResponse = [];
    subCategoryResponse = [];
    websiteResponse = [];
    if (searchFilter[0].seen == 0 ? hideSeen = false : hideSeen = true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostCubit>()
        ..getAllWebsites()
        ..getAllCategories()
        ..getAllSubCategories(),
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          // loading ----------------------------------------------------------------
          if (state.postState == RequestState.categoryLoading) {
            showLoading();
          } else if (state.postState == RequestState.subCategoryLoading) {
            showLoading();
          } else if (state.postState == RequestState.webSiteLoading) {
            showLoading();
            // done ------------------------------------------------------------------
          } else if (state.postState == RequestState.categoryLoaded) {
            hideLoading();
            for (var i in state.categoryList) {
              categoryResponse.add(i);
            }
            categoryResponse.insert(0, CategoryModel(id: 0, title: 'All'));
          } else if (state.postState == RequestState.subCategoryLoaded) {
            hideLoading();
            for (var i in state.subCategoryList) {
              subCategoryResponse.add(i);
            }
            subCategoryResponse.insert(
                0, SubCategoryModel(id: 0, title: 'All'));
          } else if (state.postState == RequestState.webSiteLoaded) {
            hideLoading();
            for (var i in state.websiteList) {
              websiteResponse.add(i);
            }
            websiteResponse.insert(0, WebsiteModel(id: 0, title: 'All'));
            // error -------------------------------------------------------
          } else if (state.postState == RequestState.categoryError) {
            hideLoading();
          } else if (state.postState == RequestState.subCategoryError) {
            hideLoading();
          } else if (state.postState == RequestState.webSiteError) {
            hideLoading();
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(20.h),
            decoration: BoxDecoration(
                color: ColorManager.kLightPink,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
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
                                text: websiteResponse[index].title!,
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
                                text: categoryResponse[index].title!,
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
                                text: subCategoryResponse[index].title!,
                                isSelected: selectedSubCategory == index)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onTap: () {
                          searchFilter[0].searchText = '';
                          searchFilter[0].website =
                              websiteResponse[selectedWebsite].title;
                          searchFilter[0].category =
                              categoryResponse[selectedCategory].title;
                          searchFilter[0].subCategory =
                              subCategoryResponse[selectedSubCategory].title;
                          searchFilter[0].seen = hideSeen ? 1 : 0;
                          widget.search();
                        },
                        text: AppStrings.filter,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Bounceable(
                      onTap: () {
                        setState(() {
                          if (hideSeen) {
                            hideSeen = false;
                            searchFilter[0].seen == 0;
                          } else {
                            hideSeen = true;
                            searchFilter[0].seen == 1;
                          }
                        });
                      },
                      duration: const Duration(seconds: 1),
                      child: Row(
                        children: [
                          Text(
                            AppStrings.hideSeen,
                            style: AppTypography.kExtraLight15.copyWith(
                                color: hideSeen
                                    ? ColorManager.kPrimary
                                    : ColorManager.kOrange),
                          ),
                          hideSeen
                              ? const Icon(Icons.done)
                              : const Icon(Icons.close)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
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
            borderRadius: BorderRadius.circular(30.r),
            color: ColorManager.kWhite),
      ),
    );
  }
}
