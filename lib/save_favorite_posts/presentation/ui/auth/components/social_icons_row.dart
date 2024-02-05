import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/auth/components/social_icons.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/strings_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';

import '../../../../shared/constant/app_typography.dart';
import '../../../../shared/constant/assets_manager.dart';

class SocialIconRow extends StatelessWidget {
  final VoidCallback googleCallback;
  final VoidCallback facebookCallback;
  const SocialIconRow(
      {super.key,
      required this.googleCallback,
      required this.facebookCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SocialIcons(
                onTap: googleCallback,
                isGoogleIcon: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsManager.googleImg,
                    ),
                    SizedBox(width: 14.w),
                    Text(
                      AppStrings.withGoogle,
                      style: AppTypography.kExtraLight14
                          .copyWith(color: ColorManager.kSecondary),
                    )
                  ],
                ))),
        SocialIcons(
          onTap: facebookCallback,
          child: Image.asset(
            AssetsManager.facebookImg,
            width: 30.w,
          ),
        ),
      ],
    );
  }
}
