import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/sub_category_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/reposnses/website_response.dart';
import 'package:save_favorite_posts/save_favorite_posts/domain/requests/iud/insert_post_request.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/add_new_post/components/filter_textfield.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';

import '../../../../core/utils/enums.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/sub_category_model.dart';
import '../../../data/models/website_model.dart';
import '../../../shared/style/colors_manager.dart';
import '../../di/di.dart';
import '../../router/app_router.dart';
import '../cubit/post/post_cubit.dart';
import '../cubit/post/post_state.dart';
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

  final FocusNode _websiteFocusNode = FocusNode();
  final FocusNode _categoryFocusNode = FocusNode();
  final FocusNode _subCategoryFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  WebsiteResponse? selectedWebSiteResponse;
  CategoryResponse? selectedCategoryResponse;
  SubCategoryResponse? selectedSubCategoryResponse;

  @override
  void initState() {
    if (websiteModel.isEmpty) {
      selectedWebSiteResponse = null;
    }
    super.initState();
  }

  void _onWebsiteSubmit(BuildContext context) {
    FocusScope.of(context).requestFocus(_categoryFocusNode);
  }

  void _onCategorySubmit(BuildContext context) {
    FocusScope.of(context).requestFocus(_subCategoryFocusNode);
  }

  void _onSubCategorySubmit(BuildContext context) {
    FocusScope.of(context).requestFocus(_descriptionFocusNode);
  }

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
            print('will done');
          } else if (state.postState == RequestState.subCategoryLoading) {
            showLoading();
            print('will done');
          } else if (state.postState == RequestState.webSiteLoading) {
            showLoading();
            print('will done');
          } else if (state.postState == RequestState.insertLoading) {
            showLoading();
            print('will done');
          } else if (state.postState == RequestState.updateLoading) {
            showLoading();
            print('will done');
            // done ------------------------------------------------------------------
          } else if (state.postState == RequestState.categoryLoaded) {
            hideLoading();
            print('doneee');
          } else if (state.postState == RequestState.subCategoryLoaded) {
            hideLoading();
            print('doneee');
          } else if (state.postState == RequestState.webSiteLoaded) {
            hideLoading();
            print('doneee');
          } else if (state.postState == RequestState.insertDone) {
            hideLoading();
            print('doneee');
          } else if (state.postState == RequestState.updateDone) {
            hideLoading();
            print('doneee');
            // error -------------------------------------------------------
          } else if (state.postState == RequestState.categoryError) {
            hideLoading();
            print('not done');
          } else if (state.postState == RequestState.subCategoryError) {
            hideLoading();
            print('not done');
          } else if (state.postState == RequestState.webSiteError) {
            hideLoading();
            print('not done');
          } else if (state.postState == RequestState.insertError) {
            hideLoading();
            print('not done');
          } else if (state.postState == RequestState.updateError) {
            hideLoading();
            print('not done');
          }
        },
        builder: (context, state) {
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
                          websiteModel.isEmpty ? FilterTextField(textEditingController: _websiteEditingController,hintName:AppStrings.website,focusNode: _websiteFocusNode,
                            onSubmit: (v) => _onWebsiteSubmit(context),) : FilterDropDown(
                            filterEditingController: _websiteEditingController,
                            selectedFilter: selectedWebSiteResponse!,
                            filterResponse: websiteModel,
                            hintText: AppStrings.website,
                          ),
                          websiteModel.isEmpty ? Container() : Padding(
                            padding: EdgeInsets.only(right: 60.w),
                            child: GestureDetector(
                              onTap: () {
                                AddNewItemDialog.show(
                                    context,
                                    NewItemDialogData(
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
                          categoryModel.isEmpty ? FilterTextField(textEditingController: _categoryEditingController,hintName:AppStrings.category,focusNode: _categoryFocusNode,
                        onSubmit: (v) => _onCategorySubmit(context),)  : FilterDropDown(
                            filterEditingController: _categoryEditingController,
                            selectedFilter: selectedCategoryResponse!,
                            filterResponse: categoryModel,
                            hintText: AppStrings.category,
                          ),
                          categoryModel.isEmpty ? Container() : Padding(
                            padding: EdgeInsets.only(right: 60.w),
                            child: GestureDetector(
                              onTap: () {
                                AddNewItemDialog.show(
                                    context,
                                    NewItemDialogData(
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
                          subCategoryModel.isEmpty ? FilterTextField(textEditingController: _subCategoryEditingController,hintName:AppStrings.subCategory,focusNode: _subCategoryFocusNode,
                            onSubmit: (v) => _onSubCategorySubmit(context),)   : FilterDropDown(
                            filterEditingController:
                                _subCategoryEditingController,
                            selectedFilter: selectedSubCategoryResponse!,
                            filterResponse: subCategoryModel,
                            hintText: AppStrings.subCategory,
                          ),
                          subCategoryModel.isEmpty ? Container() : Padding(
                            padding: EdgeInsets.only(right: 60.w),
                            child: GestureDetector(
                              onTap: () {
                                AddNewItemDialog.show(
                                    context,
                                    NewItemDialogData(
                                        dialogTitle:
                                            AppStrings.addNewSubCategory,
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
                    focusNode: _descriptionFocusNode,
                    minLines: 3,
                    maxLines: 6,
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
                        InsertPostRequest insertPostRequest = InsertPostRequest(website: _websiteEditingController.text,category: _categoryEditingController.text,subCategory: _subCategoryEditingController.text,description: descriptionController.text,link: 'www.google.com',id: null,seen: 0);
                        await PostCubit.get(context).insertPost(insertPostRequest);
                        hideLoading();
                        // Navigator.of(context).pushReplacementNamed(Routes.landing);
                      },
                      text: AppStrings.save),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
