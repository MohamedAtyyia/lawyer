import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';

PreferredSizeWidget customAppBar({
  required String requesterName,
  required String timeReamining,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: TextApp.customText(
      text: requesterName,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: ColorsApp.primary_color,
    ),
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorsApp.primary_color,
        size: 30,
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextApp.customText(
              text: 'تنتهي بعد',
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            TextApp.smallheightSpace(5),
            CountdownTimer(
              endTime: int.parse(timeReamining),
              endWidget: TextApp.customText(
                  text: 'انتهت الإستشارة',
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                  color: ColorsApp.default_color),
              textStyle: TextStyle(
                  fontFamily: 'tajwal',
                  fontSize: 12.sp,
                  color: ColorsApp.default_color,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ],
  );
}
