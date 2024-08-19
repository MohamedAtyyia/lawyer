import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../CONTROLLER/App Constant/api.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/image.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../Component/component.dart';
import 'package:al_mostashar_lawyer/main.dart';

class SalonDate extends StatefulWidget {
  const SalonDate({super.key});

  @override
  State<SalonDate> createState() => _SalonDateState();
}

class _SalonDateState extends State<SalonDate> {
  ConsultingController consultingController = Get.put(ConsultingController());

  String from1 = pref!.getString('from1') ?? '1 صباحا';
  String to1 = pref!.getString('to1') ?? '1 مساءا';

  String from2 = pref!.getString('from2') ?? '1 صباحا';
  String to2 = pref!.getString('to2') ?? '1 مساءا';

  String from3 = pref!.getString('from3') ?? '1 صباحا';
  String to3 = pref!.getString('to3') ?? '1 مساءا';

  String from4 = pref!.getString('from4') ?? '1 صباحا';
  String to4 = pref!.getString('to4') ?? '1 مساءا';

  String from5 = pref!.getString('from5') ?? '1 صباحا';
  String to5 = pref!.getString('to5') ?? '1 مساءا';

  String from6 = pref!.getString('from6') ?? '1 صباحا';
  String to6 = pref!.getString('to6') ?? '1 مساءا';

  String from7 = pref!.getString('from7') ?? '1 صباحا';
  String to7 = pref!.getString('to7') ?? '1 مساءا';

  bool p1 = pref!.getBool('p1') ?? false;
  bool p2 = pref!.getBool('p2') ?? false;
  bool p3 = pref!.getBool('p3') ?? false;
  bool p4 = pref!.getBool('p4') ?? false;
  bool p5 = pref!.getBool('p5') ?? false;
  bool p6 = pref!.getBool('p6') ?? false;
  bool p7 = pref!.getBool('p7') ?? false;

  late bool isLoading = false;

  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: const SpinKitFadingCircle(
        color: ColorsApp.primary_color,
        size: 30.0,
      ),
      dismissible: false,
      opacity: 0.4,
      color: ColorsApp.primary_color,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                height: 290.h,
                width: double.infinity,
                padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        TextApp.customText(
                            text: 'مواعيد العمل',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                        TextApp.smallwidthSpace(50),
                      ],
                    ),
                    SvgPicture.asset(
                      ImageApp.logo,
                      fit: BoxFit.scaleDown,
                      height: 77.h,
                      width: 93.w,
                    ),
                    TextApp.smallheightSpace(20),
                    TextApp.customText(
                        text:
                            'المواعيد المسجلة لهذا الأسبوع , برجاء تجديدها اسبوعيا',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        height: 1.5,
                        textAlign: TextAlign.center,
                        color: Colors.white),
                    TextApp.smallheightSpace(20),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: 230.h),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      height: 778.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          left: 10.w, right: 10.w, bottom: 30.h),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black26,
                          )),
                      child: Column(
                        children: [
                          customSalonDate(
                            dayName: HandleError.isDay(0),
                            dayDate: DateFormat('MM-dd').format(
                                HandleError.date.add(const Duration(days: 0))),
                            from: from1,
                            to: to1,
                            onChange: (String? newValue) {
                              print('onChange');
                              setState(() {
                                pref!.setString('from1', newValue!);
                                from1 = newValue;
                              });
                            },
                            onChangeTo: (String? newValue) {
                              setState(() {
                                pref!.setString('to1', newValue!);
                                to1 = newValue;
                              });
                            },
                            onChangeAvaliable: (val) {
                              print(val);
                              setState(() {
                                pref!.setBool('p1', val);
                                p1 = val;
                              });
                            },
                            switchValue: p1,
                          ),
                          customSalonDate(
                            dayName: HandleError.isDay(1),
                            dayDate: DateFormat('MM-dd').format(
                                HandleError.date.add(const Duration(days: 1))),
                            from: from2,
                            to: to2,
                            onChange: (String? newValue) {
                              setState(() {
                                pref!.setString('from2', newValue!);
                                from2 = newValue;
                              });
                            },
                            onChangeTo: (String? newValue) {
                              setState(() {
                                pref!.setString('to2', newValue!);
                                to2 = newValue;
                              });
                            },
                            onChangeAvaliable: (val) {
                              setState(() {
                                pref!.setBool('p2', val);
                                p2 = val;
                              });
                            },
                            switchValue: p2,
                          ),
                          customSalonDate(
                            dayName: HandleError.isDay(2),
                            dayDate: DateFormat('MM-dd').format(
                                HandleError.date.add(const Duration(days: 2))),
                            from: from3,
                            to: to3,
                            onChange: (String? newValue) {
                              setState(() {
                                pref!.setString('from3', newValue!);
                                from3 = newValue;
                              });
                            },
                            onChangeTo: (String? newValue) {
                              setState(() {
                                pref!.setString('to3', newValue!);
                                to3 = newValue;
                              });
                            },
                            onChangeAvaliable: (val) {
                              setState(() {
                                pref!.setBool('p3', val);
                                p3 = val;
                              });
                            },
                            switchValue: p3,
                          ),
                          customSalonDate(
                            dayName: HandleError.isDay(3),
                            dayDate: DateFormat('MM-dd').format(
                                HandleError.date.add(const Duration(days: 3))),
                            from: from4,
                            to: to4,
                            onChange: (String? newValue) {
                              setState(() {
                                pref!.setString('from4', newValue!);
                                from4 = newValue;
                              });
                            },
                            onChangeTo: (String? newValue) {
                              setState(() {
                                pref!.setString('to4', newValue!);
                                to4 = newValue;
                              });
                            },
                            onChangeAvaliable: (val) {
                              setState(() {
                                pref!.setBool('p4', val);
                                p4 = val;
                              });
                            },
                            switchValue: p4,
                          ),
                          customSalonDate(
                            dayName: HandleError.isDay(4),
                            dayDate: DateFormat('MM-dd').format(
                                HandleError.date.add(const Duration(days: 4))),
                            from: from5,
                            to: to5,
                            onChange: (String? newValue) {
                              setState(() {
                                pref!.setString('from5', newValue!);
                                from5 = newValue;
                              });
                            },
                            onChangeTo: (String? newValue) {
                              setState(() {
                                pref!.setString('to5', newValue!);
                                to5 = newValue;
                              });
                            },
                            onChangeAvaliable: (val) {
                              setState(() {
                                pref!.setBool('p5', val);
                                p5 = val;
                              });
                            },
                            switchValue: p5,
                          ),
                          customSalonDate(
                            dayName: HandleError.isDay(5),
                            dayDate: DateFormat('MM-dd').format(
                                HandleError.date.add(const Duration(days: 5))),
                            from: from6,
                            to: to6,
                            onChange: (String? newValue) {
                              setState(() {
                                pref!.setString('from6', newValue!);
                                from6 = newValue;
                              });
                            },
                            onChangeTo: (String? newValue) {
                              setState(() {
                                pref!.setString('to6', newValue!);
                                to6 = newValue;
                              });
                            },
                            onChangeAvaliable: (val) {
                              setState(() {
                                pref!.setBool('p6', val);
                                p6 = val;
                              });
                            },
                            switchValue: p6,
                          ),
                          customSalonDate(
                            dayName: HandleError.isDay(6),
                            dayDate: DateFormat('MM-dd').format(
                                HandleError.date.add(const Duration(days: 6))),
                            from: from7,
                            to: to7,
                            onChange: (String? newValue) {
                              setState(() {
                                pref!.setString('from7', newValue!);
                                from7 = newValue;
                              });
                            },
                            onChangeTo: (String? newValue) {
                              setState(() {
                                pref!.setString('to7', newValue!);
                                to7 = newValue;
                              });
                            },
                            onChangeAvaliable: (val) {
                              setState(() {
                                pref!.setBool('p7', val);
                                p7 = val;
                              });
                            },
                            switchValue: p7,
                          ),
                          TextApp.smallheightSpace(10),
                          customButton(
                            text: 'تم',
                            color: ColorsApp.primary_color,
                            textColor: Colors.white,
                            height: 56.h,
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });

                              await Future.delayed(const Duration(seconds: 0),
                                  () async {
                                setState(() {
                                  consultingController.lawyerAppoints(
                                    lawyerID: Api.id,
                                    appoints: [
                                      if (p1 == true)
                                        {
                                          "Date": DateFormat('dd/MM/yyyy')
                                              .format(HandleError.date.add(
                                                  const Duration(days: 0))),
                                          "FromHour": from1.split(' ').first,
                                          "MorEveFrst": from1.split(' ').last,
                                          "ToHour": to1.split(' ').first,
                                          "MorEveScond": to1.split(' ').last
                                        },
                                      if (p2 == true)
                                        {
                                          "Date": DateFormat('dd/MM/yyyy')
                                              .format(HandleError.date.add(
                                                  const Duration(days: 1))),
                                          "FromHour": from2.split(' ').first,
                                          "MorEveFrst": from2.split(' ').last,
                                          "ToHour": to2.split(' ').first,
                                          "MorEveScond": to2.split(' ').last
                                        },
                                      if (p3 == true)
                                        {
                                          "Date": DateFormat('dd/MM/yyyy')
                                              .format(HandleError.date.add(
                                                  const Duration(days: 2))),
                                          "FromHour": from3.split(' ').first,
                                          "MorEveFrst": from3.split(' ').last,
                                          "ToHour": to3.split(' ').first,
                                          "MorEveScond": to3.split(' ').last
                                        },
                                      if (p4 == true)
                                        {
                                          "Date": DateFormat('dd/MM/yyyy')
                                              .format(HandleError.date.add(
                                                  const Duration(days: 3))),
                                          "FromHour": from4.split(' ').first,
                                          "MorEveFrst": from4.split(' ').last,
                                          "ToHour": to4.split(' ').first,
                                          "MorEveScond": to4.split(' ').last
                                        },
                                      if (p5 == true)
                                        {
                                          "Date": DateFormat('dd/MM/yyyy')
                                              .format(HandleError.date.add(
                                                  const Duration(days: 4))),
                                          "FromHour": from5.split(' ').first,
                                          "MorEveFrst": from5.split(' ').last,
                                          "ToHour": to5.split(' ').first,
                                          "MorEveScond": to5.split(' ').last
                                        },
                                      if (p6 == true)
                                        {
                                          "Date": DateFormat('dd/MM/yyyy')
                                              .format(HandleError.date.add(
                                                  const Duration(days: 5))),
                                          "FromHour": from6.split(' ').first,
                                          "MorEveFrst": from6.split(' ').last,
                                          "ToHour": to6.split(' ').first,
                                          "MorEveScond": to6.split(' ').last
                                        },
                                      if (p7 == true)
                                        {
                                          "Date": DateFormat('dd/MM/yyyy')
                                              .format(HandleError.date.add(
                                                  const Duration(days: 6))),
                                          "FromHour": from7.split(' ').first,
                                          "MorEveFrst": from7.split(' ').last,
                                          "ToHour": to7.split(' ').first,
                                          "MorEveScond": to7.split(' ').last
                                        },
                                    ],
                                  ).whenComplete(() {
                                    setState(() {
                                      isLoading = false;
                                      HandleError.showToasts(
                                          msg: 'تم تحديث المواعيد بنجاح',
                                          color: Colors.green);
                                      Get.back();
                                    });
                                  });
                                });
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> data() {
    Map<String, dynamic> newData;
    if (p1 == true) {
      newData = {
        "WeekDay": "السبت",
        "Date": DateFormat('dd/MM/yyyy')
            .format(HandleError.date.add(const Duration(days: 0))),
        "FromHour": from1.split(' ').first,
        "MorEveFrst": from1.split(' ').last,
        "ToHour": to1.split(' ').first,
        "MorEveScond": to1.split(' ').last
      };
    } else if (p2 == true) {
      newData = {
        "WeekDay": "الأحد",
        "Date": DateFormat('dd/MM/yyyy')
            .format(HandleError.date.add(const Duration(days: 1))),
        "FromHour": from2.split(' ').first,
        "MorEveFrst": from2.split(' ').last,
        "ToHour": to2.split(' ').first,
        "MorEveScond": to2.split(' ').last
      };
    } else if (p3 == true) {
      newData = {
        "WeekDay": "الإثنين",
        "Date": DateFormat('dd/MM/yyyy')
            .format(HandleError.date.add(const Duration(days: 2))),
        "FromHour": from3.split(' ').first,
        "MorEveFrst": from3.split(' ').last,
        "ToHour": to3.split(' ').first,
        "MorEveScond": to3.split(' ').last
      };
    } else if (p4 == true) {
      newData = {
        "WeekDay": "الثلاثاء",
        "Date": DateFormat('dd/MM/yyyy')
            .format(HandleError.date.add(const Duration(days: 3))),
        "FromHour": from4.split(' ').first,
        "MorEveFrst": from4.split(' ').last,
        "ToHour": to4.split(' ').first,
        "MorEveScond": to4.split(' ').last
      };
    } else if (p5 == true) {
      newData = {
        "WeekDay": "الأربعاء",
        "Date": DateFormat('dd/MM/yyyy')
            .format(HandleError.date.add(const Duration(days: 4))),
        "FromHour": from5.split(' ').first,
        "MorEveFrst": from5.split(' ').last,
        "ToHour": to5.split(' ').first,
        "MorEveScond": to5.split(' ').last
      };
    } else if (p6 == true) {
      newData = {
        "WeekDay": "الخميس",
        "Date": DateFormat('dd/MM/yyyy')
            .format(HandleError.date.add(const Duration(days: 5))),
        "FromHour": from6.split(' ').first,
        "MorEveFrst": from6.split(' ').last,
        "ToHour": to6.split(' ').first,
        "MorEveScond": to6.split(' ').last
      };
    } else {
      newData = {
        "WeekDay": "الجمعة",
        "Date": DateFormat('dd/MM/yyyy')
            .format(HandleError.date.add(const Duration(days: 6))),
        "FromHour": from7.split(' ').first,
        "MorEveFrst": from7.split(' ').last,
        "ToHour": to7.split(' ').first,
        "MorEveScond": to7.split(' ').last
      };
    }
    return newData;
  }
}
