import 'dart:developer';
import 'dart:io';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/image.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../Component/component.dart';
import 'edit_info.dart';

class MyPersonalData extends StatefulWidget {
  MyPersonalData(
      {super.key,
      required this.email,
      required this.familyName,
      required this.fname,
      required this.card,
      required this.phone});
  String fname;
  String familyName;
  String phone;
  String email;
  String card;
  @override
  State<MyPersonalData> createState() => _MyPersonalDataState();
}

class _MyPersonalDataState extends State<MyPersonalData> {
  Auth auth = Get.put(Auth());
  int selectedIndex = 0;
  File? selectedfile1;
  File? selectedfile2;
  File? selectedfile3;
  List<String> list1 = [];
  List<String> list2 = [];
  List<String> list3 = [];
  late bool isLoading = false;
  selectFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedfile1 = File(result.files.single.path!);
      list1.add(selectedfile1!.path);
      setState(() {});
      HandleError.showToasts(msg: 'تم تحميل الملف', color: Colors.green);
    } else if (result == null) {
      setState(() {});
      HandleError.showToasts(msg: 'لم يتم تحميل ملف', color: Colors.red);
    }
  }

  selectFile2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedfile2 = File(result.files.single.path!);
      list2.add(selectedfile2!.path);
      setState(() {});
      HandleError.showToasts(msg: 'تم تحميل الملف', color: Colors.green);
    } else if (result == null) {
      setState(() {});
      HandleError.showToasts(msg: 'لم يتم تحميل ملف', color: Colors.red);
    }
  }

  selectFile3() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedfile3 = File(result.files.single.path!);
      list3.add(selectedfile3!.path);
      setState(() {});
      HandleError.showToasts(msg: 'تم تحميل الملف', color: Colors.green);
    } else if (result == null) {
      setState(() {});
      HandleError.showToasts(msg: 'لم يتم تحميل ملف', color: Colors.red);
    }
  }

  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  late String id;

  void getId() {
    setState(() {});
    id = pref!.getString('IdentityId') == null ||
            pref!.getString('IdentityId')!.isEmpty
        ? widget.card
        : pref!.getString('IdentityId')!;
    log(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getId();
    return customBlurryModal(
      isLoading: isLoading,
      circleSize: 30,
      widget: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextApp.customText(
            text: 'بياناتي الشخصية',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: ColorsApp.primary_color,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorsApp.primary_color,
            ),
          ),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w, bottom: 16.h),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 182.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == 0
                                ? ColorsApp.default_color
                                : Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: selectedIndex == 0
                              ? ColorsApp.default_color
                              : Colors.white,
                        ),
                        child: TextApp.customText(
                          text: 'بيانات الحساب',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: selectedIndex == 0
                              ? Colors.white
                              : ColorsApp.primary_color,
                        ),
                      ),
                    ),
                  ),
                  TextApp.smallwidthSpace(15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 182.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == 1
                                ? ColorsApp.default_color
                                : Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: selectedIndex == 1
                              ? ColorsApp.default_color
                              : Colors.white,
                        ),
                        child: TextApp.customText(
                          text: 'أوراق العمل',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: selectedIndex == 1
                              ? Colors.white
                              : ColorsApp.primary_color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextApp.smallheightSpace(40),
              selectedIndex == 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextApp.customText(
                                      text: 'الاسم الاول',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: ColorsApp.primary_color),
                                  customPersonalData(
                                    height: 56.h,
                                    width: 183.w,
                                    widget: TextApp.customText(
                                        text: widget.fname,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: ColorsApp.primary_color),
                                  ),
                                ],
                              ),
                            ),
                            TextApp.smallwidthSpace(14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextApp.customText(
                                      text: 'اسم العائلة',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: ColorsApp.primary_color),
                                  customPersonalData(
                                    height: 56.h,
                                    width: 183.w,
                                    widget: TextApp.customText(
                                        text: widget.familyName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: ColorsApp.primary_color),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TextApp.smallheightSpace(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextApp.customText(
                                text: 'البريد الالكتروني',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: ColorsApp.primary_color),
                          ],
                        ),
                        customPersonalData(
                          height: 56.h,
                          width: double.infinity,
                          widget: Row(
                            children: [
                              SvgPicture.asset(ImageApp.email),
                              TextApp.smallwidthSpace(10),
                              TextApp.customText(
                                  text: widget.email,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: ColorsApp.primary_color),
                            ],
                          ),
                        ),
                        TextApp.smallheightSpace(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextApp.customText(
                                text: 'الهاتف',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: ColorsApp.primary_color),
                          ],
                        ),
                        customPersonalData(
                          height: 56.h,
                          width: double.infinity,
                          widget: Row(
                            children: [
                              SvgPicture.asset(ImageApp.phone),
                              TextApp.smallwidthSpace(10),
                              TextApp.customText(
                                  text: widget.phone,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: ColorsApp.primary_color),
                            ],
                          ),
                        ),
                        TextApp.smallheightSpace(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextApp.customText(
                                text: 'بطاقة الهوية',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: ColorsApp.primary_color),
                          ],
                        ),
                        customPersonalData(
                          height: 56.h,
                          width: double.infinity,
                          widget: Row(
                            children: [
                              SvgPicture.asset(ImageApp.remember_me),
                              TextApp.smallwidthSpace(10),
                              TextApp.customText(
                                text: id,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: ColorsApp.primary_color,
                              ),
                            ],
                          ),
                        ),
                        TextApp.smallheightSpace(80),
                        customButton(
                          text: 'تعديل',
                          color: ColorsApp.primary_color,
                          textColor: Colors.white,
                          height: 56.h,
                          onTap: () {
                            Get.to(
                              () => EditInformationScreen(
                                name: widget.fname,
                                family: widget.familyName,
                                email: widget.email,
                                phone: widget.phone,
                                card: id,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        customUploadFile(
                          text: selectedfile1 == null
                              ? 'اسم المستند الاول'
                              : selectedfile1!.path.split('/').last,
                          onTap: () {
                            selectFile1();
                          },
                        ),
                        customUploadFile(
                          text: selectedfile2 == null
                              ? 'اسم المستند الثاني'
                              : selectedfile2!.path.split('/').last,
                          onTap: () {
                            selectFile2();
                          },
                        ),
                        customUploadFile(
                          text: selectedfile3 == null
                              ? 'اسم المستند الثالث'
                              : selectedfile3!.path.split('/').last,
                          onTap: () {
                            selectFile3();
                          },
                        ),
                        TextApp.smallheightSpace(30),
                        customButton(
                          text: 'طلب تعديل',
                          color: ColorsApp.primary_color,
                          textColor: Colors.white,
                          height: 56.h,
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await Future.delayed(const Duration(seconds: 5),
                                () {
                              setState(() {
                                auth
                                    .uploadFile(
                                  id: Api.id,
                                  doc1: list1,
                                  doc2: list2,
                                  doc3: list3,
                                )
                                    .then((value) {
                                  if (value == null) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: TextApp.customText(
                                          text: 'حدث خطأ',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: Colors.white),
                                      backgroundColor: ColorsApp.primary_color,
                                    ));
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.defaultDialog(
                                      title: '',
                                      contentPadding: const EdgeInsets.all(20),
                                      content: Column(
                                        children: [
                                          Lottie.asset(
                                            ImageApp.lottietimer,
                                            height: 155.h,
                                            width: 138.w,
                                          ),
                                          TextApp.smallheightSpace(21),
                                          SizedBox(
                                            height: 55.h,
                                            width: 200.w,
                                            child: TextApp.customText(
                                                text:
                                                    'تم ارسال طلب تعديل اوراقك الي إدارة التطبيق سيتم مراجعتها',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: ColorsApp.primary_color,
                                                textAlign: TextAlign.center),
                                          ),
                                          TextApp.smallheightSpace(31),
                                          customButton(
                                            text: 'حسنا',
                                            onTap: () {
                                              Get.back(closeOverlays: true);
                                            },
                                            color: ColorsApp.primary_color,
                                            textColor: Colors.white,
                                            height: 49.h,
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                });
                              });
                            });
                          },
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
