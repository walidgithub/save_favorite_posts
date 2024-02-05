import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/router/app_router.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import '../../../shared/constant/app_typography.dart';
import '../../ui_components/buttons/custom_text_button.dart';
import '../../ui_components/buttons/primary_button.dart';
import '../../ui_components/others/custom_animation.dart';
import '../../ui_components/dialogs/loading_dialog.dart';
import 'components/auth_field.dart';
import 'components/social_icons_row.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  bool isNameCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(
              children: [
                SizedBox(height: 80.h),
                Center(child: Image.asset(AssetsManager.logo,width: 100.w)),
                SizedBox(height: 30.h),
                Text(AppStrings.signUp,
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
                AuthField(
                  controller: _usernameController,
                  hintText: AppStrings.yourUsername,
                  isFieldValidated: isNameCorrect,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    isNameCorrect = validateName(value);
                    setState(() {});
                  },
                  validator: (value) {
                    if(!validateName(value!)){
                      return AppStrings.enterValidName;
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppConstants.heightBetweenElements),
                AuthField(
                  controller: _emailController,
                  hintText: AppStrings.yourEmail,
                  keyboardType: TextInputType.emailAddress,
                  isFieldValidated: isEmailCorrect,
                  onChanged: (value) {
                    setState(() {});
                    isEmailCorrect = validateEmail(value);
                  },
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
                SizedBox(height: 30.h),
                PrimaryButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        showLoading();
                        await Future.delayed(const Duration(seconds: 3));
                        hideLoading();
                        Navigator.of(context).pushReplacementNamed(Routes.signIn);
                      }
                    },
                    text: AppStrings.signUp),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.alreadyMember,
                        style: AppTypography.kLight14.copyWith(
                          color: ColorManager.kSecondary,
                        )),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Routes.signIn);
                      },
                      text: AppStrings.signIn,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final nameRegex = RegExp(r'^[a-zA-Z]+$');
      return nameRegex.hasMatch(value);
    }
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
}
