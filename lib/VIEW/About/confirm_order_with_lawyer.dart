import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/home_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/image.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../Component/component.dart';

class ConfirmOrder extends StatelessWidget {
  ConfirmOrder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageApp.background), fit: BoxFit.fitWidth)),
        child: Padding(
          padding:
              EdgeInsets.only(top: 50.h, bottom: 20.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              TextApp.smallheightSpace(100),
              TextApp.customText(
                  text:
                      'سيتم مراجعة الأوراق المرفقة والتواصل معك في اقرب وقت ممكن',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.5,
                  textAlign: TextAlign.center),
              TextApp.smallheightSpace(20),
              Lottie.asset(ImageApp.floating, height: 246.h),
              Padding(
                padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 60),
                child: customButton(
                  text: 'حسنا',
                  textColor: Colors.white,
                  color: ColorsApp.smallContainer_color,
                  height: 56.h,
                  onTap: () {
                    Get.offAll(() => HomeNav());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
