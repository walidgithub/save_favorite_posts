import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/constant_values_manager.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/style/colors_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../domain/reposnses/posts_response.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../../shared/constant/assets_manager.dart';
import '../../../../shared/constant/strings_manager.dart';
import '../../../ui_components/buttons/custom_icon_button.dart';

class SearchCard extends StatefulWidget {
  final PostsResponse postsResponse;
  final int index;
  const SearchCard({super.key, required this.postsResponse, required this.index});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(()=>FoodDishDetail(dish: dish));
      },
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
            color: ColorManager.kLightPink,
            borderRadius: BorderRadius.circular(30.r)),
        child: Row(
          children: [
            Column(
              children: [
                Text('${widget.index + 1}',
                    style: AppTypography.kBold14),
                SizedBox(height: AppConstants.smallHeightBetweenElements,),
                Text(widget.postsResponse.website,
                    style: AppTypography.kExtraLight15),
              ],
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.postsResponse.category,
                      style: AppTypography.kExtraLight18),
                  Row(
                    children: [
                      Text(
                        widget.postsResponse.subCategory,
                        style: AppTypography.kMedium14
                            .copyWith(color: ColorManager.kLightBrown),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
                  ReadMoreText(
                    widget.postsResponse.description,
                    style: AppTypography.kLight14,
                    trimLines: 3,
                    colorClickableText: ColorManager.kOrange,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: AppStrings.readMore,
                    trimExpandedText: AppStrings.less,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50.h,
                  alignment: Alignment.bottomRight,
                  child: CustomIconButton(
                    onTap: () {
                      _launchURL(widget.postsResponse.link,context);
                    },
                    size: 40.w,
                    icon: AssetsManager.goImg,
                  ),
                ),
                Checkbox(
                  checkColor: ColorManager.kWhite,
                  activeColor: ColorManager.kPrimary,
                  value: widget.postsResponse.seen == 1 ? true : false,
                  onChanged: (bool? value) {
                    setState(() {
                      // widget.postsResponse.seen = value!;
                    });
                  },
                ),
                Container(
                  height: 50.h,
                  alignment: Alignment.bottomRight,
                  child: CustomIconButton(
                    onTap: () {

                    },
                    size: 40.w,
                    icon: AssetsManager.editIcon,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _launchURL(String path, BuildContext context) async {
    Uri _url = Uri.parse(path);
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
}
