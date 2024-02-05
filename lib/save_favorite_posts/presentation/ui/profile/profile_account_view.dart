import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui_components/others/custom_animation.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import '../../../shared/constant/strings_manager.dart';
import '../../router/app_router.dart';
import '../../ui_components/buttons/custom_icon_button.dart';
import '../../ui_components/buttons/custom_outlined_button.dart';
import '../../ui_components/buttons/primary_button.dart';
import '../../ui_components/dialogs/loading_dialog.dart';
import '../auth/components/auth_field.dart';

class ProfileAccountView extends StatefulWidget {
  const ProfileAccountView({super.key});

  @override
  State<ProfileAccountView> createState() => _ProfileAccountViewState();
}

class _ProfileAccountViewState extends State<ProfileAccountView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  bool isNameCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _nameController.text = currentUser.name;
    // _emailController.text = currentUser.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeAnimation(
        delay: 0.25,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthField(
                controller: _nameController,
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
              SizedBox(height: 10.h),
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
              SizedBox(height: 10.h),
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
              Row(
                children: [
                  CustomIconButton(
                    onTap: () {
                      // Get.dialog(LogoutDialog(
                      //   onLogout: () {
                      Navigator.pushReplacementNamed(context, Routes.signIn);
                      //   },
                      // ));
                    },
                    icon: AssetsManager.logOutImg,
                    size: 50.h,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: PrimaryButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          showLoading();
                          await Future.delayed(const Duration(seconds: 3));
                          hideLoading();
                          Navigator.of(context).pop();
                        }
                      },
                      height: 50.h,
                      borderRadius: 10.r,
                      text: AppStrings.saveProfile,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      text: AppStrings.exit,
                      width: 110.w,
                      color: ColorManager.kOrange,
                      borderRadius: 10.r,
                    ),
                  )
                ],
              )
            ],
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
