import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import '../../../shared/style/colors_manager.dart';

void showLoading() {
  EasyLoading.instance
    ..loadingStyle =EasyLoadingStyle.custom
    ..backgroundColor = ColorManager.kPrimary
    ..indicatorColor = ColorManager.kWhite
    ..textColor = ColorManager.kWhite
    ..indicatorSize = 50.0.w
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..radius = 10.0.w
    ..dismissOnTap = false
  ..userInteractions = false;
  EasyLoading.show(
    maskType: EasyLoadingMaskType.black,
    status: AppStrings.loading,
  );
}

void hideLoading() {
  EasyLoading.dismiss();
}
