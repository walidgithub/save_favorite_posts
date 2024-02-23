import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/constant/strings_manager.dart';
import '../../../../shared/style/colors_manager.dart';

class FilterTextField extends StatelessWidget {
  final String hintName;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final void Function(String)? onSubmit;
  const FilterTextField({required this.textEditingController,required this.hintName,required this.focusNode,required this.onSubmit,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: textEditingController,
      focusNode: focusNode,
      onSubmitted: onSubmit,
      spellCheckConfiguration: const SpellCheckConfiguration(),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          labelText: hintName,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              fontSize: 15.sp, color: ColorManager.kSecondary),
          border: InputBorder.none),
    );
  }
}
