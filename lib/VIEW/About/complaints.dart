import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/image.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../Component/component.dart';

class Complaint extends StatelessWidget {
  Complaint({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primary_color,
      appBar: AppBar(
        backgroundColor: ColorsApp.primary_color,
        elevation: 0,
        title: TextApp.customText(
            text: 'الشكاوي والاقتراحات',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 126.h,
              width: 153.w,
              margin: EdgeInsets.only(bottom: 26.h),
              child: SvgPicture.asset(ImageApp.logo),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 43.h, bottom: 16.h, left: 16.w, right: 16.w),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white),
              child: ListView(
                children: [
                  customTextFiled(
                    text: 'الاسم',
                    controller: nameController,
                    inputType: TextInputType.text,
                    obscureText: false,
                    validator: (val) {},
                  ),
                  TextApp.smallheightSpace(24),
                  customTextFiled(
                    text: 'البريد الالكتروني',
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                    validator: (val) {},
                  ),
                  TextApp.smallheightSpace(24),
                  customTextFiled4(
                    text: 'اكتب رسالتك هنا',
                    maxline: 8,
                    controller: messageController,
                    inputType: TextInputType.multiline,
                    obscureText: false,
                  ),
                  TextApp.smallheightSpace(40),
                  customButton(
                    text: 'ارسال',
                    color: ColorsApp.primary_color,
                    textColor: Colors.white,
                    height: 56.h,
                    onTap: () {
                      Get.defaultDialog(
                        title: '',
                        contentPadding: EdgeInsets.all(20),
                        content: Column(
                          children: [
                            Lottie.asset(
                              ImageApp.lottiedone2,
                              height: 164.h,
                              width: 164.w,
                            ),
                            TextApp.smallheightSpace(21),
                            SizedBox(
                              height: 72.h,
                              width: 362.w,
                              child: TextApp.customText(
                                  text:
                                      'تم ارسال الرسالة الخاصة بك الي فريق العمل بنجاح سيتم التواصل معك قريبا علي البريد الالكتروني او رقم الهاتف الذي قمت بأدخاله',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: ColorsApp.primary_color,
                                  textAlign: TextAlign.center),
                            ),
                            TextApp.smallheightSpace(31),
                            customButton(
                              text: 'حسنا',
                              onTap: () {
                                Get.back();
                              },
                              color: ColorsApp.primary_color,
                              textColor: Colors.white,
                              height: 49.h,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
