import 'package:flutter/material.dart';

Widget textBoldComponent(BuildContext context,String text,
    {double? fontSize, Color? txtColor}) {

  return Text(text,style: TextStyle(fontSize: fontSize,fontFamily: "Thulth",color: txtColor,fontWeight: FontWeight.bold),textAlign: TextAlign.end,);
}

Widget textNormalComponent(BuildContext context,String text,
    {double? fontSize, Color? txtColor}) {

  return Text(text,style: TextStyle(fontSize: fontSize,fontFamily: "Thulth",color: txtColor),);
}