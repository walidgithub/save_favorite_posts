import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../domain/requests/iud/update_category_name_request.dart';
import '../../../../domain/requests/iud/update_sub_category_name_request.dart';
import '../../../../domain/requests/iud/update_website_name_request.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/constant/strings_manager.dart';
import '../../../../shared/style/colors_manager.dart';
import '../../../di/di.dart';
import '../../../ui_components/dialogs/loading_dialog.dart';
import '../../cubit/post/post_cubit.dart';
import '../../cubit/post/post_state.dart';
import '../../../ui_components/buttons/custom_outlined_button.dart';
import '../../../ui_components/buttons/primary_button.dart';
import '../../../ui_components/dividers/custom_divider.dart';
import 'edit_item_arguments.dart';

class EditItemDialog extends StatefulWidget {
  EditItemDialogData editItemDialogData;

  EditItemDialog({required this.editItemDialogData, super.key});

  static void show(
          BuildContext context, EditItemDialogData editItemDialogData) =>
      showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => EditItemDialog(
          editItemDialogData: editItemDialogData,
        ),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.of(context).pop();

  @override
  State<EditItemDialog> createState() => _EditItemDialogState();
}

class _EditItemDialogState extends State<EditItemDialog> {
  TextEditingController itemEditingController = TextEditingController();

  @override
  void initState() {
    itemEditingController.text = widget.editItemDialogData.oldItemName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: ColorManager.kLightPink2,
      insetPadding: EdgeInsets.zero,
      content: BlocProvider(
        create: (context) => sl<PostCubit>(),
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state.postState == RequestState.updateFilterNameLoading) {
              showLoading();
            } else if (state.postState == RequestState.updateFilterNameDone) {
              hideLoading();
              widget.editItemDialogData
                  .returnName(itemEditingController.text);
              EditItemDialog.hide(context);
            } else if (state.postState == RequestState.updateFilterNameError) {
              hideLoading();
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomDivider(),
                  SizedBox(height: 20.h),
                  Text(widget.editItemDialogData.dialogTitle,
                      style: AppTypography.kBold24),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 50.w,
                          child: TextField(
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              controller: itemEditingController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorManager.kLine2),
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.radius),
                                  ),
                                  hintText: widget.editItemDialogData.textName,
                                  labelText: widget.editItemDialogData.textName,
                                  border: InputBorder.none)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 31.h),
                  Row(
                    children: [
                      CustomOutlinedButton(
                        onTap: () {
                          EditItemDialog.hide(context);
                        },
                        text: AppStrings.close,
                        width: 110.w,
                        color: ColorManager.kOrange,
                      ),
                      const Spacer(),
                      PrimaryButton(
                        onTap: () async {
                          if (widget.editItemDialogData.textName == AppStrings.website) {
                            UpdateWebsiteNameRequest updateWebsiteNameRequest = UpdateWebsiteNameRequest(website: widget.editItemDialogData.oldItemName);
                            await PostCubit.get(context).updateWebsiteName(updateWebsiteNameRequest);
                          } else if (widget.editItemDialogData.textName == AppStrings.category) {
                            UpdateCategoryNameRequest updateCategoryNameRequest = UpdateCategoryNameRequest(category: widget.editItemDialogData.oldItemName);
                            await PostCubit.get(context).updateCategoryName(updateCategoryNameRequest);
                          } else if (widget.editItemDialogData.textName == AppStrings.subCategory) {
                            UpdateSubCategoryNameRequest updateSubCategoryNameRequest = UpdateSubCategoryNameRequest(subCategory: widget.editItemDialogData.oldItemName);
                            await PostCubit.get(context).updateSubCategoryName(updateSubCategoryNameRequest);
                          }
                        },
                        text: AppStrings.edit,
                        width: 160.w,
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
