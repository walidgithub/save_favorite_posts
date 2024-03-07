import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launch_review/launch_review.dart';
import '../../../../../core/local_db/dbHelper.dart';
import '../../../../shared/constant/app_typography.dart';
import '../../../../shared/constant/assets_manager.dart';
import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/constant/strings_manager.dart';
import '../../../../shared/style/colors_manager.dart';
import '../../../di/di.dart';

class DrawerInfo extends StatefulWidget {
  const DrawerInfo({Key? key}) : super(key: key);

  @override
  State<DrawerInfo> createState() => _DrawerInfoState();
}

class _DrawerInfoState extends State<DrawerInfo> {
  DbHelper dbHelper = sl<DbHelper>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.kBackground,
      child:
      SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(AppStrings.notes,style: AppTypography.kBold24,),
                  SizedBox(height: AppConstants.smallHeightBetweenElements,),
                  RichText(
                    text: TextSpan(
                        text: AppStrings.toBegin,
                        style: AppTypography.kBold18
                            .copyWith(color: ColorManager.kSecondary, height: 1.5),
                        children: [
                          TextSpan(
                              text: AppStrings.howToBegin,
                              style: AppTypography.kExtraLight14
                                  .copyWith(color: ColorManager.kSecondary)),

                        ]),
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(AppStrings.about,style: AppTypography.kBold24,),
                  SizedBox(height: AppConstants.smallHeightBetweenElements,),
                  Text(AppStrings.aboutText,style: AppTypography.kLight13,),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
              child: Column(
                children: [
                  Text(AppStrings.rating,style: AppTypography.kBold24,),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.clickToRate,style: AppTypography.kLight11),
                      SizedBox(width: 10.w,),
                      Bounceable(
                        onTap: () async {
                          await Future.delayed(const Duration(milliseconds: 700));
                          LaunchReview.launch();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsManager.rate,
                              width: 25.w,
                              color: ColorManager.kOrange,
                            ),
                            SvgPicture.asset(
                              AssetsManager.rate,
                              width: 25.w,
                              color: ColorManager.kOrange,
                            ),
                            SvgPicture.asset(
                              AssetsManager.rate,
                              width: 25.w,
                              color: ColorManager.kOrange,
                            ),
                            SvgPicture.asset(
                              AssetsManager.rate,
                              width: 25.w,
                              color: ColorManager.kOrange,
                            ),
                            SvgPicture.asset(
                              AssetsManager.rate,
                              width: 25.w,
                              color: ColorManager.kOrange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
                  Bounceable(
                    onTap: () async {
                      await Future.delayed(const Duration(milliseconds: 700));
                      await dbHelper.backupDB();
                      Navigator.of(context).pop();
                      final snackBar = SnackBar(
                        duration: Duration(
                            milliseconds:
                            AppConstants.durationOfSnackBar),
                        content: const Text(AppStrings.backUpDone),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AssetsManager.backUpImg,
                          width: 20.w,
                        ),
                        Text(AppStrings.backup,style: AppTypography.kBold14.copyWith(color: ColorManager.kOrange),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(AppStrings.notesToRestore,style: AppTypography.kExtraLight15,)),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
                  Bounceable(
                    onTap: () async {
                      await Future.delayed(const Duration(milliseconds: 700));
                      await dbHelper.deleteDB();
                      await dbHelper.restoreDB();
                      Navigator.of(context).pop();
                      final snackBar = SnackBar(
                        duration: Duration(
                            milliseconds:
                            AppConstants.durationOfSnackBar),
                        content: const Text(AppStrings.restoreDone),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AssetsManager.restoreImg,
                          width: 20.w,
                        ),
                        Text(AppStrings.restore,style: AppTypography.kBold14.copyWith(color: ColorManager.kOrange))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
