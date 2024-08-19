import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';

class customSection extends StatelessWidget {
  customSection(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.color,
      required this.iconColor,
      required this.textColor})
      : super(key: key);
  String text;
  Color color;
  Color textColor;
  Color iconColor;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.h,
        width: double.infinity,
        margin: EdgeInsets.only(right: 17.w, left: 17.w, bottom: 27.h),
        padding:
            EdgeInsets.only(right: 20.w, left: 20.w, top: 15.h, bottom: 15.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextApp.customText(
                text: text,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: textColor),
            Icon(
              Icons.arrow_forward_ios,
              color: iconColor,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
