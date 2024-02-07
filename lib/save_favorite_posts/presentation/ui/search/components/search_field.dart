import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import '../../../../shared/constant/app_typography.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onSubmit;
  const SearchField(
      {Key? key, required this.controller, this.focusNode, this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onSubmitted: onSubmit,
      style: AppTypography.kLight14,
      decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 55.h),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          hintText: AppStrings.search,
          hintStyle: const TextStyle(color: ColorManager.kSecondary),
          suffixIcon: Padding(
            padding: EdgeInsets.all(13.h),
            child: SvgPicture.asset(
              AssetsManager.search,
            ),
          )),
    );
  }
}
