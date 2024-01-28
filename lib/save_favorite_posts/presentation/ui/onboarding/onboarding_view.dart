import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/onboarding.dart';
import '../../../shared/constant/constant_values_manager.dart';
import 'components/custom_indicator.dart';
import 'components/onboarding_card.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark
    ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: onboardingList.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingCard(
                    index: index,
                    onBoarding: onboardingList[index],
                  );
                },
              ),
            ),
            CustomIndicator(position: currentIndex),
            SizedBox(height: 83.h),
            // CustomOutlinedButton(
            //   width: 130.w,
            //   onTap: () {
            //     // if (currentIndex == (onboardingList.length - 1)) {
            //     //   Get.offAll(() => const SignInView());
            //     // } else {
            //     //   pageController.nextPage(
            //     //     duration: const Duration(milliseconds: 500),
            //     //     curve: Curves.ease,
            //     //   );
            //     // }
            //   },
            //   text: currentIndex == (onboardingList.length - 1)
            //       ? 'Get Started'
            //       : 'Next',
            // ),
            SizedBox(height: AppConstants.heightBetweenElements),
          ],
        ),
      ),
    );
  }
}
