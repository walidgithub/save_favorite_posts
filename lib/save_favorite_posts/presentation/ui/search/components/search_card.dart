import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
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
  final Function goToEdit;
  final Function toggleSeen;
  const SearchCard(
      {super.key,
      required this.postsResponse,
      required this.index,
      required this.goToEdit,
      required this.toggleSeen});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
        color: ColorManager.kBackground,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: ColorManager.kLine, width: 1.5.w),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text('${widget.index + 1}',
                  style: AppTypography.kBold14
                      .copyWith(color: ColorManager.kOrange)),
              SizedBox(
                height: AppConstants.smallHeightBetweenElements,
              ),
              Text(widget.postsResponse.website,
                  style: AppTypography.kExtraLight15
                      .copyWith(color: ColorManager.kLightBrown)),
            ],
          ),
          SizedBox(width: 10.w),
          Container(width: 1.5.w, height: 100.h, color: ColorManager.kLine),
          SizedBox(width: 10.w),
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
                          .copyWith(color: ColorManager.kPrimary),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 50.h,
                alignment: Alignment.bottomRight,
                child: CustomIconButton(
                  onTap: () {
                    _launchURL(widget.postsResponse.link, context);
                  },
                  size: 40.w,
                  icon: AssetsManager.goImg,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Bounceable(
                onTap: () {
                  widget.toggleSeen();
                },
                duration: const Duration(seconds: 1),
                child: Row(
                  children: [
                    Text(
                      AppStrings.seen,
                      style: AppTypography.kExtraLight15.copyWith(
                          color: widget.postsResponse.seen == 1
                              ? ColorManager.kPrimary
                              : ColorManager.kOrange),
                    ),
                    widget.postsResponse.seen == 1
                        ? const Icon(Icons.done)
                        : const Icon(Icons.close)
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 50.h,
                alignment: Alignment.bottomRight,
                child: CustomIconButton(
                  onTap: () {
                    widget.goToEdit();
                  },
                  size: 40.w,
                  icon: AssetsManager.editIcon,
                ),
              ),
            ],
          )
        ],
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
