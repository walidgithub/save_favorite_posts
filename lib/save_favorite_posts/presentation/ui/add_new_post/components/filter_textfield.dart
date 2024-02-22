import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/constant/strings_manager.dart';
import '../../../../shared/style/colors_manager.dart';

class FilterTextField extends StatelessWidget {
  TextEditingController textEditingController;
  FilterTextField({required this.textEditingController,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: textEditingController,
      minLines: 3,
      // Set this
      maxLines: 6,
      // and this
      spellCheckConfiguration: const SpellCheckConfiguration(),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          labelText: AppStrings.description,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              fontSize: 15.sp, color: ColorManager.kSecondary),
          border: InputBorder.none),
    );
  }
}
