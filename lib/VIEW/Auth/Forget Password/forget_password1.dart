import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/image.dart';
import '../../../CONTROLLER/App Constant/text.dart';
import '../../../CONTROLLER/Auth/Auth.dart';
import '../../Component/component.dart';

class ForgetPassword1 extends StatefulWidget {
  ForgetPassword1({super.key});

  @override
  State<ForgetPassword1> createState() => _ForgetPassword1State();
}

class _ForgetPassword1State extends State<ForgetPassword1> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Auth forgetController = Get.put(Auth());
  late bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextApp.customText(
              text: 'نسيت كلمة المرور',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ColorsApp.primary_color),
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
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Lottie.asset(ImageApp.lottienewpassword,
                          height: 150.h, width: 150.w),
                      TextApp.smallheightSpace(30),
                      Row(
                        children: [
                          TextApp.customText(
                              text: 'أدخل الإيميل الخاص بك',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ColorsApp.primary_color),
                        ],
                      ),
                      TextApp.smallheightSpace(20),
                      customTextFiled(
                        text: 'xxxx@xxxx.com',
                        prefix: SvgPicture.asset(
                          ImageApp.phone,
                          fit: BoxFit.scaleDown,
                        ),
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'ادخل الايميل';
                          }
                        },
                      ),
                      TextApp.smallheightSpace(20),
                      Row(
                        children: [
                          TextApp.customText(
                              text: 'أدخل رقم الهاتف  الخاص بك',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ColorsApp.primary_color),
                        ],
                      ),
                      TextApp.smallheightSpace(30),
                      customTextFiled(
                        text: '966555555555',
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
                        },
                      ),
                    ],
                  ),
                ),
                TextApp.smallheightSpace(20),
                customButton(
                  text: 'التالي',
                  color: ColorsApp.primary_color,
                  textColor: Colors.white,
                  height: 56.h,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          forgetController
                              .forgetPassword(
                            UserName: emailController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                          )
                              .then((value) {
                            setState(() {
                              if (value == null) {
                                isLoading = false;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    'الايميل او رقم الجوال غير صحيح',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'tajwal',
                                        color: Colors.white),
                                  ),
                                ));
                              } else {
                                isLoading = false;
                              }
                            });
                          });
                        });
                      });
                    } else {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
