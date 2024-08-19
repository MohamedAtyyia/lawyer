import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';

Future deleteDialog({required VoidCallback confirmDelete}) {
  return Get.defaultDialog(
    title: '',
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextApp.customText(
            text: 'هل تريد حذف الدردشة',
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: Colors.black),
        TextApp.smallheightSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: confirmDelete,
              child: Container(
                height: 40.h,
                width: 80.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsApp.primary_color,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white, width: 1.w),
                ),
                child: TextApp.customText(
                    text: 'نعم',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40.h,
                width: 80.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsApp.primary_color,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white, width: 1.w),
                ),
                child: TextApp.customText(
                    text: 'لا',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
