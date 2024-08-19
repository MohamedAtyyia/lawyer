import 'dart:io';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'colors.dart';

class HandleError extends GetxController {
  static final toast = FToast();
  static var date = DateTime.now();
  static const checkInternetConnection = Center(
    child: Text(
      'تأكد من اتصال الانترنت لديك',
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'tajwal'),
    ),
  );
  static const circleIndicator2 = Center(
    child: SpinKitFadingCircle(
      color: ColorsApp.primary_color,
      size: 30.0,
    ),
  );
  static Widget mainKindShimmer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
          );
        },
      ),
    ),
  );
  static Widget majorShimmer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 30),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: 30.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
          );
        },
      ),
    ),
  );
  static Widget consultingShimmer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          height: 200.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
        );
      },
    ),
  );
  static Widget profileCardShimmer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: SizedBox(
      height: 60.h,
      width: double.infinity,
      child: Container(
        height: 110.h,
        margin: const EdgeInsets.all(17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.shade100,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 10.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.shade100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  static Widget walletShimmer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      children: [
        Container(
          height: 200.h,
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 80.h,
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 80.h,
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 80.h,
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
        ),
      ],
    ),
  );
  static Widget paymentMethodShimmer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 6; i++)
          Container(
            height: 60.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
          )
      ],
    ),
  );
  static Widget paymentTotal = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            height: 30.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
          )
      ],
    ),
  );
  static Widget consultingTime = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            height: 80.h,
            width: 100.w,
            margin: EdgeInsets.only(left: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
          )
      ],
    ),
  );
  static Widget selectDate = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 2; i++)
          Container(
            height: 150.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
          )
      ],
    ),
  );
  static Widget chooseLawyer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 5; i++)
          Container(
            height: 120.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
          )
      ],
    ),
  );
  static Widget ConsultingType = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20.h,
          margin: EdgeInsets.only(bottom: 15.h),
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300),
        ),
        Container(
          height: 60.h,
          margin: EdgeInsets.only(bottom: 15.h),
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120.h,
              width: 120.w,
              margin: EdgeInsets.only(bottom: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300),
            ),
            TextApp.smallwidthSpace(20),
            Container(
              height: 120.h,
              width: 120.w,
              margin: EdgeInsets.only(bottom: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300),
            ),
          ],
        ),
        Container(
          height: 60.h,
          margin: EdgeInsets.only(bottom: 15.h),
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300),
        ),
        Container(
          height: 60.h,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 15.h),
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300),
        ),
      ],
    ),
  );
  static Widget personalData = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60.h,
              width: 150.w,
              margin: EdgeInsets.only(bottom: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300),
            ),
            TextApp.smallwidthSpace(20),
            Container(
              height: 60.h,
              width: 150.w,
              margin: EdgeInsets.only(bottom: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300),
            ),
          ],
        ),
        for (int i = 0; i < 5; i++)
          Container(
            height: 60.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 30.h),
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
          ),
      ],
    ),
  );
  static Widget aboutShimmer = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 8; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10.h,
                  width: 10.w,
                  margin: EdgeInsets.only(bottom: 30.h, left: 20.w),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade300),
                ),
                Container(
                  height: 15.h,
                  width: 220.w,
                  margin: EdgeInsets.only(bottom: 30.h),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300),
                ),
              ],
            ),
        ],
      ),
    ),
  );
  static Widget generalConsulting = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          height: 150.h,
          width: 250.w,
          margin: EdgeInsets.only(bottom: 30.h),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          height: 30.h,
          width: 250.w,
          margin: EdgeInsets.only(bottom: 30.h),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          height: 80.h,
          width: 250.w,
          margin: EdgeInsets.only(bottom: 30.h),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          height: 150.h,
          width: 250.w,
          margin: EdgeInsets.only(bottom: 30.h),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          height: 60.h,
          width: 250.w,
          margin: EdgeInsets.only(bottom: 30.h),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
        ),
      ],
    ),
  );
  static void showToasts({required String msg, required Color color}) {
    toast.showToast(
        toastDuration: const Duration(milliseconds: 700),
        child: Container(
          height: 40.h,
          width: 200.w,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: TextApp.customText(
              text: msg,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: Colors.white),
        ),
        gravity: ToastGravity.CENTER);
  }

  static void showRecievedMessage() {
    toast.showToast(
        child: Container(
          height: 50.h,
          width: 120.w,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: ColorsApp.primary_color,
          ),
          child: TextApp.customText(
              text: 'رسالة جديدة',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white),
        ),
        gravity: ToastGravity.TOP);
  }

  static void showRecievedDelegation({required String title}) {
    toast.showToast(
        child: Container(
          height: 50.h,
          width: 200.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          ),
          child: TextApp.customText(
              text: title,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Colors.white),
        ),
        gravity: ToastGravity.CENTER);
  }

  static isDay(int e) {
    var format = DateFormat('EEEE, d MMM, yyyy')
        .format(date.add(Duration(days: e)))
        .split(',')
        .first;
    switch (format) {
      case 'Saturday':
        return 'السبت';
      case 'Sunday':
        return 'الأحد';
      case 'Monday':
        return 'الإثنين';
        break;
      case 'Tuesday':
        return 'الثلاثاء';
        break;
      case 'Wednesday':
        return 'الأربعاء';
        break;
      case 'Thursday':
        return 'الخميس';
        break;
      case 'Friday':
        return 'الجمعة';
        break;
    }
  }

  selectFile({required File? selectedfile}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedfile = File(result.files.single.path!);
      HandleError.showToasts(msg: 'تم تحميل الملف', color: Colors.green);
      update();
    }
    HandleError.showToasts(msg: ' لم يتم اختيار ملف', color: Colors.red);
  }
}
