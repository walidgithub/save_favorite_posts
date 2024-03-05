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
      backgroundColor: ColorManager.kLightPink,
      child:
      SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 230.h,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(AppStrings.notes,style: AppTypography.kExtraLight15,),
                  // RichText(
                  //   text: TextSpan(
                  //       text: text1,
                  //       style: AppTypography.kLight30
                  //           .copyWith(color: ColorManager.kSecondary, height: 1.2),
                  //       children: [
                  //         TextSpan(
                  //             text: text2,
                  //             style: AppTypography.kBold30
                  //                 .copyWith(color: ColorManager.kSecondary)),
                  //
                  //       ]),
                  // ),
                  Divider(
                    thickness: 1.h,
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Column(
                children: [
                  Text(AppStrings.rating,style: AppTypography.kExtraLight15,),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
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
                        ),
                        SvgPicture.asset(
                          AssetsManager.rate,
                          width: 25.w,
                        ),
                        SvgPicture.asset(
                          AssetsManager.rate,
                          width: 25.w,
                        ),
                        SvgPicture.asset(
                          AssetsManager.rate,
                          width: 25.w,
                        ),
                        SvgPicture.asset(
                          AssetsManager.rate,
                          width: 25.w,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
                  Bounceable(
                    onTap: () async {
                      await Future.delayed(const Duration(milliseconds: 700));
                      await dbHelper.backupDB();
                      // await dbHelper.getDBPath();
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
                        Text(AppStrings.backup,style: AppTypography.kExtraLight15,)
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
                        Text(AppStrings.restore,style: AppTypography.kExtraLight15,)
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
