import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../shared/style/colors_manager.dart';

void showLoading() {
  EasyLoading.show(
    maskType: EasyLoadingMaskType.clear,
    dismissOnTap: true,
    indicator: const CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(ColorManager.kPrimary),
    ),
  );
}

void hideLoading() {
  EasyLoading.dismiss();
}
