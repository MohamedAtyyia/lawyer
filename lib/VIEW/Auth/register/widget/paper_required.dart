import 'dart:io';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/colors.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../Component/component.dart';
import '../../login/login_screen.dart';
import '../../login/widget/dont_have_acc.dart';

class PaperRequired extends StatefulWidget {
  PaperRequired({super.key, required this.pageController});
  PageController pageController = PageController();

  @override
  State<PaperRequired> createState() => _PaperRequiredState();
}

class _PaperRequiredState extends State<PaperRequired> {
  File? selectedfile1;
  File? selectedfile2;
  File? selectedfile3;
  List<String> list1 = [];
  List<String> list2 = [];
  List<String> list3 = [];

  selectFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedfile1 = File(result.files.single.path!);
      list1.add(selectedfile1!.path);
    }
    setState(() {});
  }

  selectFile2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedfile2 = File(result.files.single.path!);
      list2.add(selectedfile2!.path);
    }
    setState(() {});
  }

  selectFile3() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedfile3 = File(result.files.single.path!);
      list3.add(selectedfile3!.path);
    }
    setState(() {});
  }

  late bool isLoading = false;
  Auth uploadPaperController = Get.put(Auth());
  final registerID = pref!.getString('registerID');

  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextApp.customText(
                    text: 'من فضلك قم بإرفاق الأوراق المطلوبة',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ],
            ),
            TextApp.smallheightSpace(20),
            customUploadFile(
              text: selectedfile1 == null ? 'اسم المستند الاول' : 'تم الإرفاق',
              onTap: () {
                selectFile1();
              },
            ),
            customUploadFile(
              text: selectedfile2 == null ? 'اسم المستند الثاني' : 'تم الإرفاق',
              onTap: () {
                selectFile2();
              },
            ),
            customUploadFile(
              text: selectedfile3 == null ? 'اسم المستند الثالث' : 'تم الإرفاق',
              onTap: () {
                selectFile3();
              },
            ),
            customButton(
              text: 'التالي',
              color: ColorsApp.primary_color,
              textColor: Colors.white,
              height: 56.h,
              onTap: () async {
                if (list1.isEmpty) {
                  HandleError.showToasts(
                      msg: 'ارفق الاوراق المطلوبة', color: Colors.red);
                } else {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 5), () {
                    setState(() {
                      uploadPaperController
                          .uploadFile(
                        id: registerID!,
                        doc1: list1.isEmpty ? [] : list1,
                        doc2: list2.isEmpty ? [] : list2,
                        doc3: list3.isEmpty ? [] : list3,
                      )
                          .then((value) {
                        setState(() {
                          isLoading = false;
                          if (value == null) {
                            HandleError.showToasts(
                                msg: 'حدث خطأ', color: Colors.red);
                          } else {
                            widget.pageController.nextPage(
                                duration: const Duration(microseconds: 100),
                                curve: Curves.bounceIn);
                          }
                        });
                      });
                    });
                  });
                }
              },
            ),
            TextApp.smallheightSpace(30),
            HaveAccount(
              text1: 'لديك حساب بالفعل ؟',
              text2: 'تسجيل الدخول',
              onTap: () {
                Get.offAll(() => LoginScreen());
              },
            ),
          ],
        ),
        if (isLoading)
          AbsorbPointer(
            child: Center(
              child: SpinKitCircle(
                color: ColorsApp.primary_color,
                size: 30.h,
              ),
            ),
          ),
      ],
    );
  }
}
