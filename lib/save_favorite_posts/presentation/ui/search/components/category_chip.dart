import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import '../../../../shared/constant/app_typography.dart';

class CategoryChip extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  const CategoryChip(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: isSelected ? ColorManager.kPrimary : null,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: isSelected ? ColorManager.kPrimary : ColorManager.kLine2)),
        child: Text(text,
            style: AppTypography.kExtraLight13.copyWith(
                color: isSelected ? ColorManager.kWhite : ColorManager.kLightBrown)),
      ),
    );
  }
}
