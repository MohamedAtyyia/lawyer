import 'package:al_mostashar_lawyer/VIEW/Auth/register/widget/paper_required.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/register/widget/personal_info_screen.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/register/widget/sign_consulting_price.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/register/widget/verify_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/image.dart';
import '../../../CONTROLLER/App Constant/text.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      PersonalInfo(
        pageController: widget.pageController,
      ),
      PaperRequired(
        pageController: widget.pageController,
      ),
      SignConsultingPrice(
        pageController: widget.pageController,
      ),
      VerifyNumber(phone: registerPhoneController.text.trim()),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextApp.customText(
            text: 'إنشاء حساب',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsApp.primary_color,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();

            return true;
          },
          child: ListView(
            children: [
              SvgPicture.asset(ImageApp.logo),
              TextApp.smallheightSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    padding:
                        currentIndex == 0 ? EdgeInsets.only(top: 6.h) : null,
                    decoration: BoxDecoration(
                        boxShadow: [
                          currentIndex == 0
                              ? BoxShadow(
                                  color:
                                      ColorsApp.primary_color.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                )
                              : const BoxShadow(
                                  color: Colors.transparent,
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                ),
                        ],
                        border: Border.all(color: ColorsApp.primary_color),
                        color: currentIndex == 0
                            ? Colors.white
                            : ColorsApp.primary_color,
                        shape: BoxShape.circle),
                    child: currentIndex == 0
                        ? TextApp.customText(
                            text: '1',
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp,
                            color: ColorsApp.primary_color)
                        : SvgPicture.asset(ImageApp.circleLinear),
                  ),
                  Expanded(
                    child: Container(
                        height: 1.h,
                        color: currentIndex == 0
                            ? ColorsApp.primary_color.withOpacity(0.3)
                            : currentIndex == 1
                                ? ColorsApp.primary_color
                                : currentIndex == 2
                                    ? ColorsApp.primary_color
                                    : ColorsApp.primary_color.withOpacity(0.3)),
                  ),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    padding: currentIndex == 1
                        ? EdgeInsets.only(top: 6.h)
                        : currentIndex == 0
                            ? EdgeInsets.only(top: 6.h)
                            : null,
                    decoration: BoxDecoration(
                        boxShadow: [
                          currentIndex == 1
                              ? BoxShadow(
                                  color:
                                      ColorsApp.primary_color.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                )
                              : const BoxShadow(
                                  color: Colors.transparent,
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                ),
                        ],
                        border: Border.all(
                            color: currentIndex != 1
                                ? ColorsApp.primary_color.withOpacity(0.3)
                                : ColorsApp.primary_color),
                        color: currentIndex == 1
                            ? Colors.white
                            : currentIndex == 1
                                ? ColorsApp.primary_color
                                : currentIndex == 0
                                    ? Colors.white
                                    : ColorsApp.primary_color,
                        shape: BoxShape.circle),
                    child: currentIndex == 1
                        ? TextApp.customText(
                            text: '2',
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp,
                            color: currentIndex != 1
                                ? ColorsApp.primary_color.withOpacity(0.3)
                                : ColorsApp.primary_color)
                        : currentIndex == 1
                            ? TextApp.customText(
                                text: '2',
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp,
                                color: currentIndex != 1
                                    ? ColorsApp.primary_color.withOpacity(0.3)
                                    : ColorsApp.primary_color)
                            : currentIndex == 0
                                ? TextApp.customText(
                                    text: '2',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.sp,
                                    color: currentIndex != 1
                                        ? ColorsApp.primary_color
                                            .withOpacity(0.3)
                                        : ColorsApp.primary_color)
                                : SvgPicture.asset(ImageApp.circleLinear),
                  ),
                  Expanded(
                    child: Container(
                        height: 1.h,
                        color: currentIndex != 2
                            ? ColorsApp.primary_color.withOpacity(0.3)
                            : ColorsApp.primary_color),
                  ),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    padding: currentIndex == 2
                        ? EdgeInsets.only(top: 6.h)
                        : currentIndex == 1
                            ? EdgeInsets.only(top: 6.h)
                            : currentIndex == 0
                                ? EdgeInsets.only(top: 6.h)
                                : null,
                    decoration: BoxDecoration(
                        boxShadow: [
                          currentIndex == 2
                              ? BoxShadow(
                                  color:
                                      ColorsApp.primary_color.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                )
                              : const BoxShadow(
                                  color: Colors.transparent,
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                ),
                        ],
                        border: Border.all(
                            color: currentIndex != 2
                                ? ColorsApp.primary_color.withOpacity(0.3)
                                : ColorsApp.primary_color),
                        color: currentIndex == 2
                            ? Colors.white
                            : currentIndex == 2
                                ? ColorsApp.primary_color
                                : currentIndex == 1
                                    ? Colors.white
                                    : currentIndex == 0
                                        ? Colors.white
                                        : ColorsApp.primary_color,
                        shape: BoxShape.circle),
                    child: currentIndex == 2
                        ? TextApp.customText(
                            text: '3',
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp,
                            color: currentIndex != 2
                                ? ColorsApp.primary_color.withOpacity(0.3)
                                : ColorsApp.primary_color)
                        : currentIndex == 2
                            ? TextApp.customText(
                                text: '3',
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp,
                                color: currentIndex != 2
                                    ? ColorsApp.primary_color.withOpacity(0.3)
                                    : ColorsApp.primary_color)
                            : currentIndex == 1
                                ? TextApp.customText(
                                    text: '3',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.sp,
                                    color: currentIndex != 2
                                        ? ColorsApp.primary_color
                                            .withOpacity(0.3)
                                        : ColorsApp.primary_color)
                                : currentIndex == 0
                                    ? TextApp.customText(
                                        text: '3',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22.sp,
                                        color: currentIndex != 2
                                            ? ColorsApp.primary_color
                                                .withOpacity(0.3)
                                            : ColorsApp.primary_color)
                                    : SvgPicture.asset(ImageApp.circleLinear),
                  ),
                  Expanded(
                    child: Container(
                        height: 1.h,
                        color: currentIndex != 3
                            ? ColorsApp.primary_color.withOpacity(0.3)
                            : ColorsApp.primary_color),
                  ),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    padding: currentIndex == 3
                        ? EdgeInsets.only(top: 6.h)
                        : currentIndex == 2
                            ? EdgeInsets.only(top: 6.h)
                            : currentIndex == 1
                                ? EdgeInsets.only(top: 6.h)
                                : currentIndex == 0
                                    ? EdgeInsets.only(top: 6.h)
                                    : null,
                    decoration: BoxDecoration(
                        boxShadow: [
                          currentIndex == 3
                              ? BoxShadow(
                                  color:
                                      ColorsApp.primary_color.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                )
                              : const BoxShadow(
                                  color: Colors.transparent,
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                ),
                        ],
                        border: Border.all(
                            color: currentIndex != 3
                                ? ColorsApp.primary_color.withOpacity(0.3)
                                : ColorsApp.primary_color),
                        color: currentIndex == 3
                            ? Colors.white
                            : currentIndex == 3
                                ? ColorsApp.primary_color
                                : currentIndex == 2
                                    ? Colors.white
                                    : currentIndex == 1
                                        ? Colors.white
                                        : currentIndex == 0
                                            ? Colors.white
                                            : ColorsApp.primary_color,
                        shape: BoxShape.circle),
                    child: currentIndex == 3
                        ? TextApp.customText(
                            text: '4',
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp,
                            color: currentIndex != 3
                                ? ColorsApp.primary_color.withOpacity(0.3)
                                : ColorsApp.primary_color)
                        : currentIndex == 2
                            ? TextApp.customText(
                                text: '4',
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp,
                                color: currentIndex != 3
                                    ? ColorsApp.primary_color.withOpacity(0.3)
                                    : ColorsApp.primary_color)
                            : currentIndex == 1
                                ? TextApp.customText(
                                    text: '4',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.sp,
                                    color: currentIndex != 0
                                        ? ColorsApp.primary_color
                                            .withOpacity(0.3)
                                        : ColorsApp.primary_color)
                                : currentIndex == 0
                                    ? TextApp.customText(
                                        text: '4',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22.sp,
                                        color: currentIndex != 1
                                            ? ColorsApp.primary_color
                                                .withOpacity(0.3)
                                            : ColorsApp.primary_color)
                                    : SvgPicture.asset(ImageApp.circleLinear),
                  ),
                ],
              ),
              TextApp.smallheightSpace(15),
              SizedBox(
                height: currentIndex == 2 ? 300.h : 800.h,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: widget.pageController,
                  itemCount: widgetList.length,
                  itemBuilder: (context, index) {
                    return widgetList[index];
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
