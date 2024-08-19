import 'dart:developer';
import 'dart:io';

import 'package:al_mostashar_lawyer/VIEW/About/confirm_order_with_lawyer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../CONTROLLER/App Constant/api.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/handle_error.dart';
import '../../CONTROLLER/App Constant/image.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../../CONTROLLER/Auth/Auth.dart';
import '../Component/component.dart';

class AgentApprovalRequestScreen extends StatefulWidget {
  const AgentApprovalRequestScreen({super.key});

  @override
  State<AgentApprovalRequestScreen> createState() =>
      _AgentApprovalRequestScreenState();
}

class _AgentApprovalRequestScreenState
    extends State<AgentApprovalRequestScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController officeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Auth AuthController = Get.put(Auth());

  late bool isLoading = false;

  File? docContract;
  File? officeLogo;
  File? docLogo;
  selectDocContract() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      docContract = File(result.files.single.path!);
      setState(() {});
      HandleError.showToasts(msg: 'تم تحميل الملف', color: Colors.green);
    } else if (result == null) {
      setState(() {});
      HandleError.showToasts(msg: 'لم يتم تحميل ملف', color: Colors.red);
    }
  }

  selectOfficeLogo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      officeLogo = File(result.files.single.path!);
      setState(() {});
      HandleError.showToasts(msg: 'تم تحميل الملف', color: Colors.green);
    } else if (result == null) {
      setState(() {});
      HandleError.showToasts(msg: 'لم يتم تحميل ملف', color: Colors.red);
    }
  }

  selectDocLogo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      docLogo = File(result.files.single.path!);
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

  @override
  Widget build(BuildContext context) {
    return customBlurryModal(
      isLoading: isLoading,
      circleSize: 30,
      widget: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextApp.customText(
              text: 'طلب اعتماد وكيل',
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
              EdgeInsets.only(top: 40.h, bottom: 20.h, left: 20.w, right: 20.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SvgPicture.asset(ImageApp.logo),
                TextApp.smallheightSpace(50),
                customTextFiled(
                  text: 'الهاتف',
                  prefix: SvgPicture.asset(
                    ImageApp.phone,
                    fit: BoxFit.scaleDown,
                  ),
                  controller: phoneController,
                  inputType: TextInputType.phone,
                  obscureText: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'ادخل رقم الهاتف';
                    }
                    return null;
                  },
                ),
                TextApp.smallheightSpace(20),
                // customTextFiled(
                //   text: 'الاسم الأول',
                //   controller: nameController,
                //   inputType: TextInputType.name,
                //   obscureText: false,
                //   validator: (val) {
                //     if (val == null || val.isEmpty) {
                //       return 'ادخل اسمك الاول';
                //     }
                //     return null;
                //   },
                // ),
                // TextApp.smallheightSpace(20),
                customTextFiled(
                  text: 'البريد الإلكتروني',
                  prefix: SvgPicture.asset(
                    ImageApp.email,
                    fit: BoxFit.scaleDown,
                  ),
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'ادخل البريد الإلكتروني';
                    }
                    return null;
                  },
                ),
                TextApp.smallheightSpace(20),
                customTextFiled(
                  text: 'اسم المكتب',
                  controller: officeController,
                  inputType: TextInputType.name,
                  obscureText: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'ادخل اسم المكتب';
                    }
                    return null;
                  },
                ),
                TextApp.smallheightSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: customTextFiled(
                        text: 'اسم المنطقه',
                        controller: regionController,
                        inputType: TextInputType.name,
                        obscureText: false,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'ادخل اسمك المنطقه';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: customTextFiled(
                        text: 'اسم المدينة',
                        controller: cityController,
                        inputType: TextInputType.name,
                        obscureText: false,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'ادخل اسمك المدينة';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                TextApp.smallheightSpace(20),
                GestureDetector(
                  onTap: () {
                    selectDocContract();
                  },
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.grey.shade100, width: 1.w),
                        color: Colors.grey.shade50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageApp.upload),
                        TextApp.smallheightSpace(20),
                        TextApp.customText(
                          text: docContract == null
                              ? ' ترخيص توثيق العقود'
                              : docContract!.path.split('/').last,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                ),
                TextApp.smallheightSpace(20),
                GestureDetector(
                  onTap: () {
                    selectOfficeLogo();
                  },
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.grey.shade100, width: 1.w),
                        color: Colors.grey.shade50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageApp.upload),
                        TextApp.smallheightSpace(20),
                        TextApp.customText(
                            text: officeLogo == null
                                ? 'صورة ترخيص مكتب المحامة'
                                : officeLogo!.path.split('/').last,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                ),
                TextApp.smallheightSpace(50),
                GestureDetector(
                  onTap: () {
                    selectDocLogo();
                  },
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.grey.shade100, width: 1.w),
                        color: Colors.grey.shade50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageApp.upload),
                        TextApp.smallheightSpace(20),
                        TextApp.customText(
                            text: docLogo == null
                                ? 'صورة المستند '
                                : docLogo!.path.split('/').last,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                ),
                TextApp.smallheightSpace(50),
                customButton(
                  text: 'إرسال',
                  color: ColorsApp.primary_color,
                  textColor: Colors.white,
                  height: 56.h,
                  onTap: () async {
                    if (phoneController.text.isEmpty) {
                      return HandleError.showToasts(
                          msg: 'ادخل رقم الهاتف',
                          color: ColorsApp.primary_color);
                    } else if (docContract == null) {
                      return HandleError.showToasts(
                          msg: 'ارفق ترخيص توثيق العقود',
                          color: ColorsApp.primary_color);
                    } else if (officeLogo == null) {
                      return HandleError.showToasts(
                          msg: 'ارفاق صورة ترخيص مكتب المحامة',
                          color: ColorsApp.primary_color);
                    } else if (docLogo == null) {
                      return HandleError.showToasts(
                          msg: 'ارفاق صورة المستند',
                          color: ColorsApp.primary_color);
                    } else {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(
                          const Duration(seconds: 5),
                          () {
                            setState(
                              () {
                                AuthController.agentApprovalRequest(
                                  createdBy: Api.id,
                                  phone: phoneController.text.trim(),
                                  email: emailController.text.trim(),
                                  docContract: docContract!,
                                  docLogo: docLogo!,
                                  officeLogo: officeLogo!,
                                  city: cityController.text.trim(),
                                  region: regionController.text.trim(),
                                  officeName: officeController.text.trim(),
                                ).then(
                                  (value) {
                                    log('agentApprovalRequest $value');
                                    setState(
                                      () {
                                        isLoading = false;
                                        Get.offAll(() => ConfirmOrder());
                                      },
                                    );
                                  },
                                ).catchError(
                                  (e) {
                                    setState(
                                      () {
                                        isLoading = false;
                                      },
                                    );
                                    HandleError.showToasts(
                                      msg: e.toString(),
                                      color: Colors.red,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      }
                    }
                  },
                ),
                TextApp.smallheightSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
