import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui_components/others/custom_animation.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

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
                hintText: 'Your name',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 10.h),
              AuthField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                isFieldValidated: isEmailCorrect,
                onChanged: (value) {
                  setState(() {});
                  isEmailCorrect = validateEmail(value);
                },
                hintText: 'Your Email',
                validator: (value) {
                  if (!validateEmail(value!)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              AuthField(
                hintText: 'Your Password',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                isForgetButton: true,
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password should be at least 6 characters';
                  } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                      .hasMatch(value)) {
                    return 'Password should contain at least one uppercase letter, one lowercase letter, and one digit';
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
                      text: 'Save Profile',
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
                      text: 'Exit',
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
