import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/home_nav.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../CONTROLLER/App Constant/image.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../Component/component.dart';

class EditInformationScreen extends StatefulWidget {
  EditInformationScreen(
      {super.key,
      required this.card,
      required this.email,
      required this.name,
      required this.family,
      required this.phone});
  String name;
  String family;
  String phone;
  String email;
  String card;
  @override
  State<EditInformationScreen> createState() => _EditInformationScreenState();
}

class _EditInformationScreenState extends State<EditInformationScreen> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController familyController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController cardController = TextEditingController();

  Auth editController = Get.put(Auth());

  late bool isLoading = false;

  @override
  void initState() {
    nameController.text = widget.name;
    familyController.text = widget.family;
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    cardController.text = widget.card;
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 1,
      progressIndicator: const SpinKitFadingCircle(
        color: ColorsApp.primary_color,
        size: 30.0,
      ),
      dismissible: false,
      opacity: 0.4,
      color: ColorsApp.primary_color,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextApp.customText(
              text: 'تعديل البيانات الشخصية',
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
          child: ListView(
            children: [
              SvgPicture.asset(ImageApp.logo),
              TextApp.smallheightSpace(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: customTextFiled(
                      text: 'الاسم الأول',
                      controller: nameController,
                      inputType: TextInputType.name,
                      obscureText: false,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'ادخل اسمك الاول';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextApp.smallwidthSpace(10),
                  Expanded(
                    child: customTextFiled(
                      text: 'اسم العائلة',
                      controller: familyController,
                      inputType: TextInputType.name,
                      obscureText: false,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'ادخل اسم العائلة';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextApp.smallheightSpace(20),
              customTextFiled(
                text: 'البريد الإلكتروني',
                prefix: SvgPicture.asset(
                  ImageApp.email,
                  fit: BoxFit.scaleDown,
                ),
                suffix: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextApp.customText(
                        text: '(اختياري)',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey.shade400),
                  ],
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
              customTextFiled(
                text: 'بطاقة الهوية',
                prefix: SvgPicture.asset(
                  ImageApp.personalCard,
                  fit: BoxFit.scaleDown,
                ),
                controller: cardController,
                inputType: TextInputType.phone,
                obscureText: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'ادخل رقم البطاقة';
                  }
                  return null;
                },
              ),
              TextApp.smallheightSpace(50),
              customButton(
                text: 'تعديل',
                textColor: Colors.white,
                color: ColorsApp.primary_color,
                height: 56.h,
                onTap: () async {
                  if (nameController.text.isEmpty) {
                    return HandleError.showToasts(
                        msg: 'ادخل اسمك', color: ColorsApp.primary_color);
                  } else if (familyController.text.isEmpty) {
                    return HandleError.showToasts(
                        msg: 'ادخل اسم العائلة',
                        color: ColorsApp.primary_color);
                  } else if (phoneController.text.isEmpty) {
                    return HandleError.showToasts(
                        msg: 'ادخل رقم الهاتف', color: ColorsApp.primary_color);
                  } else if (familyController.text.isEmpty) {
                    return HandleError.showToasts(
                        msg: 'ادخل اسم العائلة',
                        color: ColorsApp.primary_color);
                  } else if (cardController.text.isEmpty) {
                    return HandleError.showToasts(
                        msg: 'ادخل رقم هويتك', color: ColorsApp.primary_color);
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(
                      const Duration(seconds: 5),
                      () {
                        setState(
                          () {
                            editController
                                .editInfo(
                              id: Api.id,
                              phone: phoneController.text.trim(),
                              fName: nameController.text.trim(),
                              faName: familyController.text.trim(),
                              email: emailController.text.trim(),
                              identifyId: cardController.text.trim(),
                            )
                                .then(
                              (value) {
                                setState(
                                  () {
                                    isLoading = false;
                                    // Get.back();
                                    Get.offAll(() => const HomeNav());
                                    HandleError.showToasts(
                                      msg: 'تم تحديث بياناتك بنجاح',
                                      color: Colors.green,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
              TextApp.smallheightSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
