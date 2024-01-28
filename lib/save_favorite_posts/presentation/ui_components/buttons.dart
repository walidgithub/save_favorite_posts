import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../shared/constant/constant_values_manager.dart';
import 'text_component.dart';

class ButtonComponent extends StatelessWidget {
  Color color;
  Color txtColor;
  Color borderColor;
  String buttonText;
  Function execute;
  ButtonComponent({required this.color, required this.txtColor, required this.borderColor, required this.buttonText, required this.execute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () async {
        await Future.delayed(Duration(milliseconds: AppConstants.durationOfBounceable));
        execute();
      },
      child: Container(
        height: 40.h,
        width: 130.w,
        padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(AppConstants.radius)),
        child: Center(child: textBoldComponent(context, buttonText,txtColor: txtColor, fontSize: 18.sp)),
      ),
    );
  }
}
