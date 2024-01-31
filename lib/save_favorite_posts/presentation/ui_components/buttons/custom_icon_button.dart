import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final Color? iconColor;
  final Color? borderCol;
  final double? size;
  const CustomIconButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.iconColor,
      this.borderCol,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size ?? 50.h,
        width: size ?? 50.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: iconColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: borderCol ?? const Color(0xFFD3BBAA)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            icon,
            color: iconColor != null ? ColorManager.kWhite : ColorManager.kSecondary,
          ),
        ),
      ),
    );
  }
}
