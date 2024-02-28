import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../../shared/constant/app_typography.dart';
import '../../../shared/constant/constant_values_manager.dart';
import '../../../shared/style/colors_manager.dart';
import '../../di/di.dart';
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
  final Function goToSearch;
  final List searchList;
  final int postId;
  const AddNewPostView({required this.goToSearch, required this.searchList, required this.postId, Key? key}) : super(key: key);

  @override
  State<AddNewPostView> createState() => _AddNewPostViewState();
}

class _AddNewPostViewState extends State<AddNewPostView> {
  final TextEditingController _postLinkController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
    categoryResponse = [];
    subCategoryResponse = [];
    websiteResponse = [];
    print('data from search');
    print(widget.postId);
    print(widget.searchList);
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
          } else if (state.postState == RequestState.subCategoryLoading) {
            showLoading();
          } else if (state.postState == RequestState.webSiteLoading) {
            showLoading();
          } else if (state.postState == RequestState.insertLoading) {
            showLoading();
          } else if (state.postState == RequestState.updateLoading) {
            showLoading();
            // done ------------------------------------------------------------------
          } else if (state.postState == RequestState.categoryLoaded) {
            hideLoading();
            for (var i in state.categoryList) {
              categoryResponse.add(i);
            }
            categoryResponse.insert(0, CategoryModel(id: 0, title: 'None'));
            selectedCategoryResponse = categoryResponse[0];
          } else if (state.postState == RequestState.subCategoryLoaded) {
            hideLoading();
            for (var i in state.subCategoryList) {
              subCategoryResponse.add(i);
            }
            subCategoryResponse.insert(
                0, SubCategoryModel(id: 0, title: 'None'));
            selectedSubCategoryResponse = subCategoryResponse[0];
          } else if (state.postState == RequestState.webSiteLoaded) {
            hideLoading();
            for (var i in state.websiteList) {
              websiteResponse.add(i);
            }
            websiteResponse.insert(0, WebsiteModel(id: 0, title: 'None'));
            selectedWebSiteResponse = websiteResponse[0];
          } else if (state.postState == RequestState.insertDone) {
            hideLoading();
          } else if (state.postState == RequestState.updateDone) {
            hideLoading();
            // error -------------------------------------------------------
          } else if (state.postState == RequestState.categoryError) {
            hideLoading();
          } else if (state.postState == RequestState.subCategoryError) {
            hideLoading();
          } else if (state.postState == RequestState.webSiteError) {
            hideLoading();
          } else if (state.postState == RequestState.insertError) {
            hideLoading();
          } else if (state.postState == RequestState.updateError) {
            hideLoading();
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
                      controller: _postLinkController,
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
                  websiteResponse.isNotEmpty ? Align(
                    alignment: Alignment.bottomLeft,
                      child: Text('${AppStrings.website}:', style: AppTypography.kExtraLight14,)) : Container(),
                  SizedBox(
                      height: 60.h,
                      child: Stack(
                        children: [
                          websiteResponse.isEmpty
                              ? FilterTextField(
                                  textEditingController:
                                      _websiteEditingController,
                                  hintName: AppStrings.website,
                                  focusNode: _websiteFocusNode,
                                  onSubmit: (v) => _onWebsiteSubmit(context),
                                )
                              : FilterDropDown(
                                  filterEditingController:
                                      _websiteEditingController,
                                  selectedFilter: selectedWebSiteResponse!,
                                  filterResponse: websiteResponse,
                                  hintText: AppStrings.searchForWebsite,
                                  onChanged: (websiteResponse) {
                                    setState(() {
                                      selectedWebSiteResponse = websiteResponse;
                                    });
                                  },
                                ),
                          websiteResponse.isEmpty
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(right: 60.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      AddNewItemDialog.show(
                                          context,
                                          NewItemDialogData(
                                              dialogTitle:
                                                  AppStrings.addNewWebsite,
                                              newItemName: AppStrings.website,
                                              returnName: (String newItem) {
                                                setState(() {
                                                  websiteResponse.add(
                                                      WebsiteModel(
                                                          title: newItem,
                                                          id: null));
                                                  selectedWebSiteResponse =
                                                      websiteResponse
                                                          .where((element) =>
                                                              element.title ==
                                                              newItem)
                                                          .first;
                                                });
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
                  categoryResponse.isNotEmpty ? Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('${AppStrings.category}:', style: AppTypography.kExtraLight14,)) : Container(),
                  SizedBox(
                      height: 60.h,
                      child: Stack(
                        children: [
                          categoryResponse.isEmpty
                              ? FilterTextField(
                                  textEditingController:
                                      _categoryEditingController,
                                  hintName: AppStrings.category,
                                  focusNode: _categoryFocusNode,
                                  onSubmit: (v) => _onCategorySubmit(context),
                                )
                              : FilterDropDown(
                                  filterEditingController:
                                      _categoryEditingController,
                                  selectedFilter: selectedCategoryResponse!,
                                  filterResponse: categoryResponse,
                                  hintText: AppStrings.searchForCategory,
                                  onChanged: (categoryResponse) {
                                    setState(() {
                                      selectedCategoryResponse =
                                          categoryResponse;
                                    });
                                  },
                                ),
                          Container(),
                          categoryResponse.isEmpty
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(right: 60.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      AddNewItemDialog.show(
                                          context,
                                          NewItemDialogData(
                                              dialogTitle:
                                                  AppStrings.addNewCategory,
                                              newItemName: AppStrings.category,
                                              returnName: (String newItem) {
                                                setState(() {
                                                  categoryResponse.add(
                                                      CategoryModel(
                                                          title: newItem,
                                                          id: null));
                                                  selectedCategoryResponse =
                                                      categoryResponse
                                                          .where((element) =>
                                                              element.title ==
                                                              newItem)
                                                          .first;
                                                });
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
                  subCategoryResponse.isNotEmpty ? Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('${AppStrings.subCategory}:', style: AppTypography.kExtraLight14,)) : Container(),
                  SizedBox(
                      height: 60.h,
                      child: Stack(
                        children: [
                          subCategoryResponse.isEmpty
                              ? FilterTextField(
                                  textEditingController:
                                      _subCategoryEditingController,
                                  hintName: AppStrings.subCategory,
                                  focusNode: _subCategoryFocusNode,
                                  onSubmit: (v) =>
                                      _onSubCategorySubmit(context),
                                )
                              : FilterDropDown(
                                  filterEditingController:
                                      _subCategoryEditingController,
                                  selectedFilter: selectedSubCategoryResponse!,
                                  filterResponse: subCategoryResponse,
                                  hintText: AppStrings.searchForSubCategory,
                                  onChanged: (subCategoryResponse) {
                                    setState(() {
                                      selectedSubCategoryResponse =
                                          subCategoryResponse;
                                    });
                                  },
                                ),
                          subCategoryResponse.isEmpty
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(right: 60.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      AddNewItemDialog.show(
                                          context,
                                          NewItemDialogData(
                                              dialogTitle:
                                                  AppStrings.addNewSubCategory,
                                              newItemName:
                                                  AppStrings.subCategory,
                                              returnName: (String newItem) {
                                                setState(() {
                                                  subCategoryResponse.add(
                                                      SubCategoryModel(
                                                          title: newItem,
                                                          id: null));
                                                  selectedSubCategoryResponse =
                                                      subCategoryResponse
                                                          .where((element) =>
                                                              element.title ==
                                                              newItem)
                                                          .first;
                                                });
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
                    controller: _descriptionController,
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
                        _postLinkController.text = 'https://www.google.com/';
                        if (websiteResponse.isNotEmpty) {
                          _websiteEditingController.text = selectedWebSiteResponse!.title.toString();
                        }
                        if (categoryResponse.isNotEmpty) {
                          _categoryEditingController.text = selectedCategoryResponse!.title.toString();
                        }
                        if (subCategoryResponse.isNotEmpty) {
                          _subCategoryEditingController.text = selectedSubCategoryResponse!.title.toString();
                        }

                        if (_postLinkController.text.trim() == "") {
                          final snackBar = SnackBar(
                            duration: Duration(
                                milliseconds: AppConstants.durationOfSnackBar),
                            content: const Text(AppStrings.linkRequired),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        } else if (_websiteEditingController.text.trim() ==
                            "") {
                          final snackBar = SnackBar(
                            duration: Duration(
                                milliseconds: AppConstants.durationOfSnackBar),
                            content: const Text(AppStrings.websiteRequired),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        } else if (_categoryEditingController.text.trim() ==
                            "") {
                          final snackBar = SnackBar(
                            duration: Duration(
                                milliseconds: AppConstants.durationOfSnackBar),
                            content: const Text(AppStrings.categoryRequired),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        } else if (_descriptionController.text.trim() ==
                            "") {
                          final snackBar = SnackBar(
                            duration: Duration(
                                milliseconds: AppConstants.durationOfSnackBar),
                            content: const Text(AppStrings.descriptionRequired),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                        showLoading();
                        InsertPostRequest insertPostRequest = InsertPostRequest(
                            website: websiteResponse.isEmpty
                                ? _websiteEditingController.text
                                : selectedWebSiteResponse!.title,
                            category: categoryResponse.isEmpty
                                ? _categoryEditingController.text
                                : selectedCategoryResponse!.title,
                            subCategory: subCategoryResponse.isEmpty
                                ? _subCategoryEditingController.text
                                : selectedSubCategoryResponse!.title,
                            description: _descriptionController.text,
                            link: 'www.google.com',
                            seen: 0);
                        await PostCubit.get(context)
                            .insertPost(insertPostRequest);
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
