import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../shared/constant/constant_values_manager.dart';
import '../../../../shared/style/colors_manager.dart';

class ShimmerCard extends StatefulWidget {
  const ShimmerCard({super.key});

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.kLightPink),
            borderRadius: BorderRadius.circular(30.r)),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 10.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      color: ColorManager.kWhite,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                SizedBox(
                  height: AppConstants.smallHeightBetweenElements,
                ),
                Container(
                  width: 80.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      color: ColorManager.kWhite,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: ColorManager.kWhite,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: ColorManager.kWhite,
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.smallHeightBetweenElements,
                  ),
                  Container(
                    width: 130.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: ColorManager.kWhite,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: ColorManager.kWhite,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                SizedBox(height: 10.h,),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: ColorManager.kWhite,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                SizedBox(height: 10.h,),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: ColorManager.kWhite,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
