import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/image.dart';
import '../../../CONTROLLER/App Constant/text.dart';
import '../../Component/component.dart';
import '../../Home Nav/home_nav.dart';

class ChangePasswordComplete extends StatelessWidget {
  const ChangePasswordComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageApp.background),
          fit: BoxFit.fitWidth
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.h,bottom: 20.h,left: 20.w,right: 20.w),
        child: Column(
          children: [
           TextApp.customText(text: 'نسيت كلمة المرور', fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
           TextApp.smallheightSpace(120),
           TextApp.customText(text: 'تم تغير كلمة المرور بنجاح', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
           Lottie.asset(ImageApp.lottiedone,height: 300.h),
           Padding(
             padding: EdgeInsets.only(right: 30.w,left: 30.w,top: 60),
             child: customButton(
                text: 'حسنا',
                color: ColorsApp.smallContainer_color,
                textColor: Colors.white,
                height: 56.h,
                onTap: (){
                  Get.offAll(()=> HomeNav());
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