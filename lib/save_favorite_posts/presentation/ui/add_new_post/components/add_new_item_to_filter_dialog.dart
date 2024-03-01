import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/constant/strings_manager.dart';
import '../../../../shared/style/colors_manager.dart';
import 'add_new_item_arguments.dart';
import '../../../ui_components/buttons/custom_outlined_button.dart';
import '../../../ui_components/buttons/primary_button.dart';
import '../../../ui_components/dividers/custom_divider.dart';

class AddNewItemDialog extends StatefulWidget {
  NewItemDialogData newItemDialogData;

  AddNewItemDialog({required this.newItemDialogData, super.key});

  static void show(BuildContext context, NewItemDialogData newItemDialogData) =>
      showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => AddNewItemDialog(
          newItemDialogData: newItemDialogData,
        ),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.of(context).pop();

  @override
  State<AddNewItemDialog> createState() => _AddNewItemDialogState();
}

class _AddNewItemDialogState extends State<AddNewItemDialog> {
  TextEditingController itemEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: ColorManager.kLightPink2,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomDivider(),
            SizedBox(height: 20.h),
            Text(widget.newItemDialogData.dialogTitle, style: AppTypography.kBold24),
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
                              borderSide: const BorderSide(color: ColorManager.kLine2),
                              borderRadius: BorderRadius.circular(AppConstants.radius),
                            ),
                            hintText: widget.newItemDialogData.textName,
                            labelText: widget.newItemDialogData.textName,
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
                    AddNewItemDialog.hide(context);
                  },
                  text: AppStrings.close,
                  width: 110.w,
                  color: ColorManager.kOrange,
                ),
                const Spacer(),
                PrimaryButton(
                  onTap: () {
                    widget.newItemDialogData.returnName(itemEditingController.text);
                    AddNewItemDialog.hide(context);
                  },
                  text: AppStrings.add,
                  width: 160.w,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
