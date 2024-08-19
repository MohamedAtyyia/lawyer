import 'package:badges/badges.dart' as badges;
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Home%20Page/screen/custom_switch.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Home%20Page/screen/private_consulting.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Home%20Page/screen/public_consulting.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Home%20Page/screen/request_delegation.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/image.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../CONTROLLER/Auth/Auth.dart';
import '../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../../CONTROLLER/Home Nav/methods.dart';
import '../../About/Notifications/notifications.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConsultingController consultingController = Get.put(ConsultingController());
  Methods methods = Get.put(Methods());

  final name = pref!.getString('name') ?? '';
  int selectedIndex = 0;
  int count = 0;
  bool _switchValue = pref!.getBool('isGet') ?? true;
  Auth auth = Get.put(Auth());
  var status;

  PersonalData() {
    auth.getPersonalData(id: Api.id).then((value) {
      var status = pref!.setString('status2', value!.status!);
      status = status;
    });
  }

  @override
  void initState() {
    PersonalData();
    methods.generateRandomNumber();
    HandleError.toast.init(context);
    FirebaseMessaging.onMessage.listen((RemoteMessage messagr) {
      setState(() {
        count++;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final status2 = pref!.getString('status2');
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: Container(
              height: 300.h,
              width: double.infinity,
              padding: EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [
                    ColorsApp.primary_color,
                    ColorsApp.white12,
                    ColorsApp.primary_color,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApp.customText(
                          text: 'أهلاً $name',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 260.w,
                        child: TextApp.customText(
                            text: 'تصفح الاستشارات الجديده وطلبات التفويض',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      TextApp.customText(
                          text: 'عدد الزوار الحالي ${methods.randomNumber}',
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp,
                          color: Colors.white),
                      const SizedBox(height: 10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextApp.customText(
                              text: 'تلقي الطلبات',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white),
                          TextApp.smallwidthSpace(0),
                        ],
                      ),
                    ],
                  ),
                  badges.Badge(
                    position: badges.BadgePosition.topStart(start: 2, top: 3),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    showBadge: count == 0 ? false : true,
                    badgeStyle: const badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.red,
                    ),
                    ignorePointer: true,
                    badgeContent: TextApp.customText(
                        text: count.toString(),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.white),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Notifications());
                      },
                      child: Container(
                          height: 48.w,
                          width: 48.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorsApp.smallContainer_color),
                          child: SvgPicture.asset(ImageApp.bell)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: 190.h, bottom: 5.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextApp.smallheightSpace(22),
                  // GestureDetector(
                  //   onTap: () {
                  //     if (status2 == "غير مفعل" || status2 == "معلق") {
                  //       HandleError.showToasts(
                  //           msg: 'بإنتظار مراجعة الحساب', color: Colors.red);
                  //     } else {
                  //       Get.to(() => SearchScreen());
                  //     }
                  //   },
                  //   child: Padding(
                  //     padding: EdgeInsets.only(right: 20.w, left: 20.w),
                  //     child: const customSearchBar(),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 17.w, right: 17.w, top: 17.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (status2 == "غير مفعل" || status2 == "معلق") {
                                HandleError.showToasts(
                                    msg: 'بإنتظار مراجعة الحساب',
                                    color: Colors.red);
                              } else {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              }
                            },
                            child: Container(
                              height: 56.h,
                              width: 121.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == 0
                                      ? ColorsApp.default_color
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: TextApp.customText(
                                text: 'الاستشارات العامة',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                fontSize: 14,
                                color: selectedIndex == 0
                                    ? ColorsApp.default_color
                                    : ColorsApp.primary_color,
                              ),
                            ),
                          ),
                        ),
                        TextApp.smallwidthSpace(8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (status2 == "غير مفعل" || status2 == "معلق") {
                                HandleError.showToasts(
                                    msg: 'بإنتظار مراجعة الحساب',
                                    color: Colors.red);
                              } else {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              }
                            },
                            child: Container(
                              height: 56.h,
                              width: 121.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == 1
                                      ? ColorsApp.default_color
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: TextApp.customText(
                                text: 'الاستشارات الخاصة',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                fontSize: 14,
                                color: selectedIndex == 1
                                    ? ColorsApp.default_color
                                    : ColorsApp.primary_color,
                              ),
                            ),
                          ),
                        ),
                        TextApp.smallwidthSpace(8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (status2 == "غير مفعل" || status2 == "معلق") {
                                HandleError.showToasts(
                                    msg: 'بإنتظار مراجعة الحساب',
                                    color: Colors.red);
                              } else {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              }
                            },
                            child: Container(
                              height: 56.h,
                              width: 121.w,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: 10.w, left: 10.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == 2
                                      ? ColorsApp.default_color
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: TextApp.customText(
                                text: 'طلبات التفويض',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                fontSize: 14,
                                color: selectedIndex == 2
                                    ? ColorsApp.default_color
                                    : ColorsApp.primary_color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  status2 == "غير مفعل" || status2 == "معلق"
                      ? const SizedBox()
                      : Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              if (selectedIndex == 0) PublicConsulting(),
                              if (selectedIndex == 1) PrivateConsulting(),
                              if (selectedIndex == 2) RequestDelegation(),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          // status2 == "غير مفعل" || status2 == "معلق"
          //     ? const SizedBox()
          //     : Positioned(
          //         top: 173.h,
          //         right: 110.w,
          //         child: CustomSwitch(
          //           value: _switchValue,
          //           height: 20.h,
          //           width: 40.w,
          //           switchHeight: 13.h,
          //           switchWidth: 13.w,
          //           enableColor: Colors.green,
          //           disableColor: Colors.grey.shade300,
          //           onChanged: (val) {
          //             setState(() {
          //               pref!.setBool('isGet', val);
          //               _switchValue = val;
          //               if (val == true) {
          //                 consultingController.ActiveLawyerAccount(id: Api.id)
          //                     .then((value) => HandleError.showToasts(
          //                         msg: value['errorMessage'],
          //                         color: Colors.green));
          //               } else if (val == false) {
          //                 consultingController
          //                     .deActiveLawyerAccount(id: Api.id)
          //                     .then((value) => HandleError.showToasts(
          //                         msg: value['errorMessage'],
          //                         color: Colors.red));
          //               }
          //             });
          //           },
          //         ),
          //       ),
        ],
      ),
    );
  }
}
