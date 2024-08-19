import 'dart:async';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../CONTROLLER/App Constant/api.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/image.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../../CONTROLLER/Auth/Auth.dart';
import '../../CONTROLLER/Home Nav/home_nav_controller.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  HomeNavController controller = Get.put(HomeNavController());
  Auth auth = Get.put(Auth());
  AudioPlayer audioPlayer = AudioPlayer();
  var status;

  PersonalData() {
    auth.getPersonalData(id: Api.id).then((value) {
      var status = pref!.setString('status', value!.status!);
      status = status;
    });
  }

  final StreamController<int> _streamController =
      StreamController<int>.broadcast();
  TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    PersonalData();
    HandleError.toast.init(context);
    _streamController.add(controller.itemSelected);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showDialog(message);
    });

    super.initState();
  }

  void _showDialog(RemoteMessage? notification) {
    if (mounted) {
      switch (controller.itemSelected) {
        case 0:
          if (notification!.data['channelId'] == '3') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else if (notification.data['channelId'] == '2') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else {
            HandleError.showRecievedMessage();
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          }
          break;
        case 1:
          if (notification!.data['channelId'] == '3') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else if (notification.data['channelId'] == '2') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else {
            HandleError.showRecievedMessage();
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          }
          break;
        case 2:
          if (notification!.data['channelId'] == '3') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else if (notification.data['channelId'] == '2') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else {}

          break;
        default:
          if (notification!.data['channelId'] == '3') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else if (notification.data['channelId'] == '2') {
            HandleError.showRecievedDelegation(
                title: notification.notification!.body!);
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          } else {
            HandleError.showRecievedMessage();
            audioPlayer.play(AssetSource('images/notification_sound.mpeg'));
          }
          break;
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.listScreen[controller.itemSelected],
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 64.h,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 5, blurRadius: 5),
                ],
                border: Border.all(color: Colors.grey.shade200, width: 1.w),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          controller.itemSelected = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                              height: 20.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                ImageApp.home,
                                color: controller.itemSelected == 0
                                    ? ColorsApp.default_color
                                    : ColorsApp.primary_color,
                                fit: BoxFit.scaleDown,
                              )),
                          TextApp.smallheightSpace(6),
                          TextApp.customText(
                              text: 'الرئيسية',
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: controller.itemSelected == 0
                                  ? ColorsApp.default_color
                                  : ColorsApp.primary_color),
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          final status = pref!.getString('status');
                          if (status == "غير مفعل") {
                            HandleError.showToasts(
                                msg: 'بإنتظار مراجعة الحساب',
                                color: Colors.red);
                          } else if (status == 'معلق') {
                            HandleError.showToasts(
                                msg: 'تم تعليق حسابك', color: Colors.red);
                          } else {
                            controller.itemSelected = 1;
                          }
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                              height: 20.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                ImageApp.consulting,
                                color: controller.itemSelected == 1
                                    ? ColorsApp.default_color
                                    : ColorsApp.primary_color,
                                fit: BoxFit.scaleDown,
                              )),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextApp.customText(
                              text: 'استشاراتي',
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: controller.itemSelected == 1
                                  ? ColorsApp.default_color
                                  : ColorsApp.primary_color)
                        ],
                      )),
                  // TextApp.smallwidthSpace(20),
                  InkWell(
                      onTap: () {
                        setState(() {
                          final status = pref!.getString('status');
                          if (status == "غير مفعل") {
                            HandleError.showToasts(
                                msg: 'بإنتظار مراجعة الحساب',
                                color: Colors.red);
                          } else if (status == 'معلق') {
                            HandleError.showToasts(
                                msg: 'تم تعليق حسابك', color: Colors.red);
                          } else {
                            controller.itemSelected = 2;
                          }
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          SvgPicture.asset(
                            ImageApp.wallet,
                            color: controller.itemSelected == 2
                                ? ColorsApp.default_color
                                : ColorsApp.primary_color,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextApp.customText(
                              text: 'محفظتي',
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: controller.itemSelected == 3
                                  ? ColorsApp.default_color
                                  : ColorsApp.primary_color)
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          final status = pref!.getString('status');
                          if (status == "غير مفعل") {
                            HandleError.showToasts(
                                msg: 'بإنتظار مراجعة الحساب',
                                color: Colors.red);
                          } else if (status == 'معلق') {
                            HandleError.showToasts(
                                msg: 'تم تعليق حسابك', color: Colors.red);
                          } else {
                            controller.itemSelected = 3;
                          }
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          SvgPicture.asset(
                            ImageApp.more,
                            color: controller.itemSelected == 4
                                ? ColorsApp.default_color
                                : ColorsApp.primary_color,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextApp.customText(
                              text: 'المزيد',
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: controller.itemSelected == 3
                                  ? ColorsApp.default_color
                                  : ColorsApp.primary_color)
                        ],
                      )),
                ],
              ),
            ),
            // Positioned(
            //   top: -30,
            //   child: InkWell(
            //     onTap: () {
            //       setState(() {
            //         final status = pref!.getString('status');
            //         if (status == "غير مفعل") {
            //           HandleError.showToasts(
            //               msg: 'بإنتظار مراجعة الحساب', color: Colors.red);
            //         } else if (status == 'معلق') {
            //           HandleError.showToasts(
            //               msg: 'تم تعليق حسابك', color: Colors.red);
            //         } else {
            //           controller.itemSelected = 2;
            //         }
            //       });
            //     },
            //     child: Container(
            //       height: 60.h,
            //       width: 60.w,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //           border:
            //               Border.all(color: Colors.grey.shade100, width: 1.w),
            //           shape: BoxShape.circle,
            //           color: controller.itemSelected == 2
            //               ? ColorsApp.default_color
            //               : Colors.white),
            //       child: SvgPicture.asset(
            //         ImageApp.messanger,
            //         color: controller.itemSelected == 2
            //             ? Colors.white
            //             : ColorsApp.primary_color,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
