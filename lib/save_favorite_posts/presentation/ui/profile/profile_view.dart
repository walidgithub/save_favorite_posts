import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/profile/profile_account_view.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import '../../../shared/constant/app_typography.dart';
import '../../../shared/services/image_picker.dart';
import '../../../shared/style/colors_manager.dart';
import '../../ui_components/dividers/custom_divider.dart';
import '../../ui_components/others/custom_indicator_shape.dart';
import 'components/change_image_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
                color: const Color(0xFFFFE2CD),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const CustomDivider(),
                SizedBox(height: 20.h),
                ChangeImageCard(
                  onTap: () async {
                    pickedImage =
                        await ImagePickerServices().getImageFromGallery();
                    setState(() {});
                  },
                  pickedImage: pickedImage,
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(AppStrings.welcomeTo,
                      style: AppTypography.kExtraLight18
                          .copyWith(color: ColorManager.kSecondary)),
                ),
                Center(
                  child: Text('user name',
                      style: AppTypography.kBold30
                          .copyWith(color: ColorManager.kOrange)),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const ProfileAccountView(),
                ),
              ],
            )),
      ),
    );
  }
}
