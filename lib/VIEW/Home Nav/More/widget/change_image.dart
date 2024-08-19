import 'dart:developer';
import 'dart:io';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/text.dart';
import 'package:al_mostashar_lawyer/VIEW/Component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';

class ChangeImageScreen extends StatefulWidget {
  ChangeImageScreen({super.key, required this.image});
  String image;
  @override
  State<ChangeImageScreen> createState() => _ChangeImageScreenState();
}

class _ChangeImageScreenState extends State<ChangeImageScreen> {
  Auth changePersonalImage = Get.put(Auth());
  File? image;
  late bool isLoading = false;
  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return customBlurryModal(
      isLoading: isLoading,
      circleSize: 30,
      widget: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorsApp.primary_color,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: TextApp.customText(
              text: 'تغيير الصورة الشخصية',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: ColorsApp.primary_color),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: ColorsApp.primary_color,
                          isScrollControlled: true,
                          isDismissible: true,
                          useRootNavigator: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          clipBehavior: Clip.none,
                          builder: (context) {
                            return Wrap(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final XFile? pickedFile =
                                        await ImagePicker().pickImage(
                                            source: ImageSource.camera);
                                    if (pickedFile == null) return;
                                    setState(
                                        () => image = File(pickedFile.path));
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 50.h,
                                    margin:
                                        EdgeInsets.only(right: 20.w, top: 10.h),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.camera,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        const Text(
                                          'الكاميرا',
                                          style: TextStyle(
                                              fontFamily: 'tajwal',
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final XFile? pickedFile =
                                        await ImagePicker().pickImage(
                                            source: ImageSource.gallery);
                                    if (pickedFile == null) return;
                                    setState(
                                        () => image = File(pickedFile.path));
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        right: 20.w, top: 10.h, bottom: 10.h),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.image,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        const Text(
                                          'الاستوديو',
                                          style: TextStyle(
                                              fontFamily: 'tajwal',
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: image == null
                        ? Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(400),
                              child: Image.network(
                                '${widget.image}',
                                height: 100.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(400),
                              child: Image.file(
                                image!,
                                height: 100.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              TextApp.smallheightSpace(80),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: customButton(
                  height: 60.h,
                  text: 'رفع الصورة',
                  textColor: Colors.white,
                  color: ColorsApp.primary_color,
                  onTap: () async {
                    if (image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: TextApp.customText(
                            text: 'لم يتم إرفاق صورة',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: Colors.white),
                        backgroundColor: Colors.red,
                        duration: const Duration(milliseconds: 500),
                      ));
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          changePersonalImage
                              .uploadPersonalImage(
                            id: Api.id,
                            image: image!.path,
                          )
                              .then((value) {
                            if (value == null) {
                              HandleError.showToasts(
                                  msg: 'لم يتم رفع الصورة', color: Colors.red);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                          isLoading = false;
                          HandleError.showToasts(
                              msg: 'تم تغيير الصورة الشخصية',
                              color: Colors.green);
                          Get.back();
                        });
                      });
                    }
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
