import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/onboarding.dart';
import '../../../../shared/style/colors_manager.dart';

class CustomIndicator extends StatelessWidget {
  final int position;
  const CustomIndicator({required this.position,super.key});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: onboardingList.length,
      position: position,
      decorator: DotsDecorator(
        color: Colors.grey.withOpacity(0.5),
        size: const Size.square(8.0),
        activeSize: const Size(20.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        activeColor: ColorManager.kPrimary,
      ),
    );
  }
}
