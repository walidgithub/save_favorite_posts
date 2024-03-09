import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import '../../../../domain/entities/onboarding.dart';
import '../../../../shared/constant/app_typography.dart';

class OnBoardingCard extends StatelessWidget {
  final OnBoarding onBoarding;
  final int index;
  const OnBoardingCard({
    required this.onBoarding,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Image.asset(onBoarding.image,fit: BoxFit.cover),
          ),
          SizedBox(height: AppConstants.heightBetweenElements),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: onBoarding.title1,
                  style: AppTypography.kLight36
                      .copyWith(color: ColorManager.kSecondary),
                  children: [
                    TextSpan(
                      text: onBoarding.title2,
                      style: AppTypography.kBold36,
                    )
                  ]),
            ),
          ),
          SizedBox(height: AppConstants.heightBetweenElements),
          Text(
            onBoarding.description,
            style: AppTypography.kLight16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
