import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';

import '../../../data/models/category_model.dart';
import '../../../data/models/sub_category_model.dart';
import '../../../data/models/website_model.dart';
import '../../../shared/style/colors_manager.dart';
import '../../router/app_router.dart';
import 'components/add_new_item_arguments.dart';
import '../../ui_components/buttons/primary_button.dart';
import '../../ui_components/dialogs/loading_dialog.dart';
import '../../ui_components/others/custom_animation.dart';
import '../../ui_components/texts/heading_rich_text.dart';
import 'components/add_new_item_to_filter.dart';
import 'components/filter_drop_down.dart';

class AddNewPostView extends StatefulWidget {
  const AddNewPostView({Key? key}) : super(key: key);

  @override
  State<AddNewPostView> createState() => _AddNewPostViewState();
}

class _AddNewPostViewState extends State<AddNewPostView> {
  final TextEditingController postLinkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController _websiteEditingController =
      TextEditingController();
  final TextEditingController _categoryEditingController =
      TextEditingController();
  final TextEditingController _subCategoryEditingController =
      TextEditingController();

  WebsiteResponse selectedWebSiteResponse = websiteModel[0];
  CategoryResponse selectedCategoryResponse = categoryModel[0];
  SubCategoryResponse selectedSubCategoryResponse = subCategoryModel[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const HeadingRichText(
                text1: '${AppStrings.external}\n',
                text2: AppStrings.addNewPost,
              ),
              SizedBox(height: 28.h),
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: FadeAnimation(
        delay: 0.5,
        child: Column(
          children: [
            TextField(
                autofocus: true,
                readOnly: true,
                keyboardType: TextInputType.text,
                spellCheckConfiguration: const SpellCheckConfiguration(),
                controller: postLinkController,
                decoration: InputDecoration(
                    // hintText: '${list?.join("\n\n")}',
                    hintText: AppStrings.link,
                    hintStyle: TextStyle(fontSize: 15.sp),
                    labelText: AppStrings.postLink,
                    labelStyle: TextStyle(
                        fontSize: 15.sp, color: ColorManager.kSecondary),
                    border: InputBorder.none)),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
                height: 60.h,
                child: Stack(
                  children: [
                    FilterDropDown(
                      filterEditingController: _websiteEditingController,
                      selectedFilter: selectedWebSiteResponse,
                      filterResponse: websiteModel,
                      hintText: AppStrings.website,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 60.w),
                      child: GestureDetector(
                        onTap: () {
                          AddNewItemDialog.show(context,  NewItemDialogData(
                              dialogTitle: AppStrings.addNewWebsite,
                              newItemName: AppStrings.website,
                              returnName: (String newItem) {

                                setState(() {});
                              }));
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            color: ColorManager.kLightBrown,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
                height: 60.h,
                child: Stack(
                  children: [
                    FilterDropDown(
                      filterEditingController: _categoryEditingController,
                      selectedFilter: selectedCategoryResponse,
                      filterResponse: categoryModel,
                      hintText: AppStrings.category,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 60.w),
                      child: GestureDetector(
                        onTap: () {
                          AddNewItemDialog.show(context,  NewItemDialogData(
                              dialogTitle: AppStrings.addNewCategory,
                              newItemName: AppStrings.category,
                              returnName: (String newItem) {

                                setState(() {});
                              }));
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            color: ColorManager.kLightBrown,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
                height: 60.h,
                child: Stack(
                  children: [
                    FilterDropDown(
                      filterEditingController: _subCategoryEditingController,
                      selectedFilter: selectedSubCategoryResponse,
                      filterResponse: subCategoryModel,
                      hintText: AppStrings.subCategory,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 60.w),
                      child: GestureDetector(
                        onTap: () {
                          AddNewItemDialog.show(context,  NewItemDialogData(
                              dialogTitle: AppStrings.addNewSubCategory,
                              newItemName: AppStrings.subCategory,
                              returnName: (String newItem) {

                                setState(() {});
                              }));
                      },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            color: ColorManager.kLightBrown,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            // description -------------------------------------------------------------------------
            TextField(
              autofocus: false,
              controller: descriptionController,
              minLines: 3, // Set this
              maxLines: 6, // and this
              spellCheckConfiguration: const SpellCheckConfiguration(),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  labelText: AppStrings.description,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(
                      fontSize: 15.sp, color: ColorManager.kSecondary),
                  border: InputBorder.none),
            ),
            SizedBox(
              height: 20.h,
            ),
            PrimaryButton(
                onTap: () async {
                  showLoading();
                  await Future.delayed(const Duration(seconds: 3));
                  hideLoading();
                  // Navigator.of(context).pushReplacementNamed(Routes.landing);
                },
                text: AppStrings.save),
          ],
        ),
      ),
    );
  }
}
