import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import 'app_typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.kPrimary),
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.kBackground,
      appBarTheme: const AppBarTheme(
        iconTheme:IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: ColorManager.kBackground,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppConstants.heightBetweenElements,
          vertical: 16.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.kLine),
          borderRadius: BorderRadius.circular(AppConstants.radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.kLine),
          borderRadius: BorderRadius.circular(AppConstants.radius),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.kLine),
          borderRadius: BorderRadius.circular(AppConstants.radius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.kLine),
          borderRadius: BorderRadius.circular(AppConstants.radius),
        ),
        hintStyle: AppTypography.kLight14,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorManager.kBackground,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ));
}

// Default Overlay.
SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);
