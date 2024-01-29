import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/onboarding.dart';
import '../../../shared/constant/constant_values_manager.dart';
import '../../router/app_router.dart';
import '../../ui_components/buttons/custom_outlined_button.dart';
import 'components/custom_indicator.dart';
import 'components/onboarding_card.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
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
                itemCount: onBoardingList.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingCard(
                    index: index,
                    onBoarding: onBoardingList[index],
                  );
                },
              ),
            ),
            CustomIndicator(position: currentIndex),
            SizedBox(height: 50.h),
            CustomOutlinedButton(
              width: 130.w,
              onTap: () {
                if (currentIndex == (onBoardingList.length - 1)) {
                  Navigator.of(context).pushReplacementNamed(Routes.signIn);
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              text: currentIndex == (onBoardingList.length - 1)
                  ? 'Get Started'
                  : 'Next',
            ),
            SizedBox(height: AppConstants.heightBetweenElements),
          ],
        ),
      ),
    );
  }
}
