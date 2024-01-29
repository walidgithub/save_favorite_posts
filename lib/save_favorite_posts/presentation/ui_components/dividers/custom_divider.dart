import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/style/colors_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5.h,
        width: 60.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r), color: ColorManager.kWhite),
      ),
    );
  }
}