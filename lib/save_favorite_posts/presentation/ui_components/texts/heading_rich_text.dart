import 'package:flutter/material.dart';
import '../../../shared/constant/app_typography.dart';
import '../../../shared/style/colors_manager.dart';
import '../profile_image_card.dart';

class HeadingRichText extends StatelessWidget {
  final String text1;
  final String text2;
  const HeadingRichText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: text1,
              style: AppTypography.kLight30
                  .copyWith(color: ColorManager.kSecondary, height: 1.2),
              children: [
                TextSpan(
                    text: text2,
                    style: AppTypography.kBold30
                        .copyWith(color: ColorManager.kSecondary))
              ]),
        ),
        const ProfileImageCard()
      ],
    );
  }
}
