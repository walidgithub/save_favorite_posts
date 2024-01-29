import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import 'dart:async';

import '../../../shared/constant/app_typography.dart';
import '../../ui_components/buttons/custom_outlined_button.dart';
import '../../ui_components/buttons/primary_button.dart';
import 'components/auth_field.dart';
import 'components/dotted_circle_container.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final _formKey = GlobalKey<FormState>();
  final _verificationCodeController = TextEditingController();
  int _timerSeconds = 25;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Center(child: Image.asset(AssetsManager.logo,width: 100.w)),
              SizedBox(height: 30.h),
              Text(
                'Verification Code',
                style:
                    AppTypography.kBold30.copyWith(color: ColorManager.kSecondary),
              ),
              Text(
                'Resend after $_timerSeconds seconds',
                style: AppTypography.kLight14
                    .copyWith(color: ColorManager.kSecondary),
              ),
              SizedBox(height: 40.h),
              AuthField(
                controller: _verificationCodeController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                hintText: 'Enter your verification code',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your verification code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),
              PrimaryButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                text: 'Verification',
              ),
              SizedBox(height: 74.h),
              DottedCircleContainer(
                radius: 40.0,
                dotColor: const Color(0xFFF5D3BB),
                child: Container(
                  padding: EdgeInsets.all(15.h),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: ColorManager.kOrange,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$_timerSeconds' 's',
                    style: AppTypography.kLight14
                        .copyWith(color: ColorManager.kWhite),
                  ),
                ),
              ),
              SizedBox(height: AppConstants.heightBetweenElements),
              _timerSeconds == 0
                  ? PrimaryButton(
                      onTap: () {
                        setState(() {
                          _timerSeconds = 25;
                        });
                        startTimer();
                      },
                      text: 'Resent',
                      width: 110.w,
                      borderRadius: 10.r,
                    )
                  : CustomOutlinedButton(
                      onTap: () {},
                      text: 'Resend',
                      width: 110.w,
                      borderRadius: 10.r,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
