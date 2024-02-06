import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import '../../../../core/preferences/app_pref.dart';
import '../../../../core/utils/functions.dart';
import '../../../shared/constant/app_typography.dart';
import '../../di/di.dart';
import '../../router/app_router.dart';
import '../../ui_components/buttons/custom_text_button.dart';
import '../../ui_components/buttons/primary_button.dart';
import '../../ui_components/others/custom_animation.dart';
import '../../ui_components/dialogs/loading_dialog.dart';
import 'components/auth_field.dart';
import 'components/social_icons_row.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;

  final AppPreferences _appPreferences = sl<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton:
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _changeLanguage();
              });
            },
            backgroundColor: ColorManager.kPrimary,
            child: SvgPicture.asset(
              AssetsManager.language,
              width: 30.w,
              color: ColorManager.kWhite,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: FadeAnimation(
              delay: 1,
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Center(child: Image.asset(AssetsManager.logo,width: 100.w,)),
                  SizedBox(height: 30.h),
                  Text(AppStrings.signIn,
                      style: AppTypography.kBold30
                          .copyWith(color: ColorManager.kSecondary)),
                  SizedBox(height: 24.h),
                  SocialIconRow(
                    facebookCallback: () {

                    },
                    googleCallback: () {

                    },
                  ),
                  SizedBox(height: 30.h),
                  Text(AppStrings.orWithEmail, style: AppTypography.kLight14),
                  SizedBox(height: 23.h),
                  AuthField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    isFieldValidated: isEmailCorrect,
                    onChanged: (value) {
                      setState(() {});
                      isEmailCorrect = validateEmail(value);
                    },
                    hintText: AppStrings.yourEmail,
                    validator: (value) {
                      if (!validateEmail(value!)) {
                        return AppStrings.enterValidEmailAddress;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppConstants.heightBetweenElements),
                  AuthField(
                    hintText: AppStrings.yourPassword,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isForgetButton: true,
                    isPasswordField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.enterYourPassword;
                      } else if (value.length < 6) {
                        return AppStrings.passShouldBeSixCharacters;
                      } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                          .hasMatch(value)) {
                        return AppStrings.passDigits;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 0.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.forgotPass);
                      },
                      text: AppStrings.forgetPasswordQ,
                      color: ColorManager.kPrimary,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          showLoading();
                          await Future.delayed(const Duration(seconds: 3));
                          hideLoading();
                          Navigator.of(context).pushReplacementNamed(Routes.landing);
                        }
                      },
                      text: AppStrings.signIn),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.newUser,
                          style: AppTypography.kLight14.copyWith(
                            color: ColorManager.kSecondary,
                          )),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.signOut);
                        },
                        text: AppStrings.signUp,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      );
      return emailRegex.hasMatch(value);
    }
  }

  _changeLanguage() {
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }
}


