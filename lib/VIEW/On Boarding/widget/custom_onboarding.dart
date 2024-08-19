// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../../CONTROLLER/App Constant/colors.dart';
// import '../../../CONTROLLER/App Constant/image.dart';
// import '../../../CONTROLLER/App Constant/text.dart';
// import '../../Auth/login/login_screen.dart';
// import '../../Component/component.dart';

// class customOnBoarding extends StatefulWidget {
//    customOnBoarding({super.key});

//   @override
//   State<customOnBoarding> createState() => _customOnBoardingState();
// }

// class _customOnBoardingState extends State<customOnBoarding> {

// List<String> imageList = [
//   ImageApp.lottiepepole,
//   ImageApp.lottiemafia,
//   ImageApp.lottieLaw,
// ];
// int currentIndex = 2;
//   PageController? _controller;

//   @override
//   void initState() {
//     _controller = PageController(initialPage: 2);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(ImageApp.background),
//           fit: BoxFit.fitWidth
//         )
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(top: 30.h,bottom: 20.h,left: 20.w,right: 20.w),
//         child: Column(
//           children: [
//             if (currentIndex == imageList.length - 1 || currentIndex == imageList.length - 2)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                customSmallButton(
//                 text: 'تخطي',
//                 image: ImageApp.doubleArrowRight,
//                 onTap: (){
//                   Get.offAll(()=> LoginScreen());
//                 },
//                ),
//               ],
//             ),
//             Expanded(
//               child: PageView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 controller: _controller,
//                 itemCount: imageList.length,
//                 itemBuilder: ((context, index){
//                   return Lottie.asset(imageList[index],height: 300.h);
//                 }
//                 ),
//                 onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               ),
//             ),
//             TextApp.customText(text: 'شاشة ترحيبية', fontWeight: FontWeight.bold, fontSize: 30, color: ColorsApp.default_color),
//             TextApp.smallheightSpace(30),
//             TextApp.customText(text: 'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النص لوريم ايبسوم هو نموذج افتراضي يوضع', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white,textAlign: TextAlign.center),
//             TextApp.smallheightSpace(50),
//              Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                customSmallButton(
//                 text: 'التالي',
//                 image: ImageApp.arrowRight,
//                 onTap: (){
//                   if(currentIndex == imageList.length - 1 || currentIndex == imageList.length -2 ){
//                     _controller!.previousPage(duration: const Duration(milliseconds: 100),curve: Curves.bounceIn);
//                   } else if(_controller!.hasClients == true){
//                     Get.offAll(()=> LoginScreen());
//                   }

//                 },
//                ),
//                TextApp.smallwidthSpace(50),
//                Expanded(
//                  child: SmoothPageIndicator(
//                   controller: _controller!,

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/Chat/Notification/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/image.dart';
import '../../../CONTROLLER/App Constant/text.dart';
//                   count: 3,
//                   effect: const ScrollingDotsEffect(
//                     fixedCenter: true,
//                     paintStyle: PaintingStyle.fill,
//                     activeDotColor: ColorsApp.default_color,
//                     dotColor: ColorsApp.default_color,
//                     dotHeight: 12,
//                     dotWidth: 12
//                   ),
//                   ),
//                ),
//                TextApp.smallwidthSpace(50),
//                  if (currentIndex == imageList.length - 2 || currentIndex == imageList.length - 3)
//                 customSmallButton2(
//                 text: 'رجوع',
//                 image: ImageApp.arrowLeft,
//                 onTap: (){
//                   _controller!.nextPage(duration: const Duration(milliseconds: 100),curve: Curves.bounceIn);
//                 },
//                 ),
//                 if (currentIndex == imageList.length - 1)
//                 SizedBox(
//                   height: 42.h,
//                   width: 90.w,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import '../../../main.dart';
import '../../Auth/login/login_screen.dart';
import '../../Component/component.dart';

class customOnBoarding extends StatefulWidget {
  const customOnBoarding({super.key});

  @override
  State<customOnBoarding> createState() => _customOnBoardingState();
}

class _customOnBoardingState extends State<customOnBoarding> {
  List<String> imageList = [
    ImageApp.lottiepepole,
    ImageApp.lottiemafia,
    ImageApp.lottieLaw,
  ];

  List<String> title = [
    'إنشاء حساب',
    'الإستشارة القانونية',
    'دراسة قضية',
    'سهولة التواصل',
  ];
  List<String> subTitle = [
    'قم بانشاء حساب أولا لتتمكن من طلب استشارة قانونية أو دراسة قضيه.',
    'عبارة عن استشارة قانونية مختصرة في مجال معين حيث سيجيب علي الإستشاره محامي مرخص بنفس المجال.',
    'حيث يمكنك طرح تفاصيل قضية مفصلة , وسيقوم المحامين المرخصين بنفس المجال من تقديم عروضهم ليتسني لك اختيار المانسب لك.',
    'ستتمكن من إكمال جميع طلباتك واستفساراتك ومتابعتها بكل سهولة',
  ];
  int currentIndex = 2;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 2);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ImageApp.background),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding:
            EdgeInsets.only(top: 30.h, bottom: 20.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            if (currentIndex == imageList.length - 1 ||
                currentIndex == imageList.length - 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customSmallButton(
                    text: 'تخطي',
                    image: ImageApp.doubleArrowRight,
                    onTap: () async {
                      await pref!.setBool('skipOnBoarding', true);
                      Get.offAll(() => LoginScreen());
                    },
                  ),
                ],
              ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                itemCount: imageList.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Lottie.asset(imageList[index], height: 300.h),
                      TextApp.smallheightSpace(30),
                      TextApp.customText(
                          text: title[index],
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: ColorsApp.default_color),
                      TextApp.smallheightSpace(30),
                      TextApp.customText(
                          text: subTitle[index],
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.white,
                          textAlign: TextAlign.center),
                      TextApp.smallheightSpace(50),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          customSmallButton(
                            text: 'التالي',
                            image: ImageApp.arrowRight,
                            onTap: () async {
                              if (currentIndex == imageList.length - 1 ||
                                  currentIndex == imageList.length - 2) {
                                _controller!.previousPage(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.bounceIn);
                              } else if (_controller!.hasClients == true) {
                                await pref!.setBool('skipOnBoarding', true);
                                Get.offAll(() => LoginScreen());
                              }
                            },
                          ),
                          TextApp.smallwidthSpace(50),
                          Expanded(
                            child: SmoothPageIndicator(
                              controller: _controller!,
                              count: 3,
                              effect: const ScrollingDotsEffect(
                                fixedCenter: true,
                                paintStyle: PaintingStyle.fill,
                                activeDotColor: ColorsApp.default_color,
                                dotColor: ColorsApp.default_color,
                                dotHeight: 12,
                                dotWidth: 12,
                              ),
                            ),
                          ),
                          TextApp.smallwidthSpace(50),
                          if (currentIndex == imageList.length - 2 ||
                              currentIndex == imageList.length - 3) ...[
                            customSmallButton2(
                              text: 'رجوع',
                              image: ImageApp.arrowLeft,
                              onTap: () {
                                _controller!.nextPage(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.bounceIn);
                              },
                            ),
                          ],
                          if (currentIndex == imageList.length - 1)
                            SizedBox(
                              height: 42.h,
                              width: 90.w,
                            ),
                        ],
                      ),
                    ],
                  );
                }),
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
