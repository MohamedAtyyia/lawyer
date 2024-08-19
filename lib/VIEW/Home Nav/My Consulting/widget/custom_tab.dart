import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../CONTROLLER/App Constant/text.dart';

class customTapBarItem extends StatelessWidget {
   customTapBarItem({super.key,required this.itemColor,required this.text,required this.textColor,required this.onTap,required this.borderColor});
   Color itemColor;
   Color textColor;
   Color borderColor;
   String text;
   VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        margin: EdgeInsets.only(left: 10.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.w
          ),
          borderRadius: BorderRadius.circular(5),
          color: itemColor,
        ),
        child: TextApp.customText(
            text: text,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: textColor,
            ),
      ),
    );
  }
}