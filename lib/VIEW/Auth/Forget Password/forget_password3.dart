import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/image.dart';
import '../../../CONTROLLER/App Constant/text.dart';
import '../../../CONTROLLER/Auth/Auth.dart';
import '../../../main.dart';
import '../../Component/component.dart';

class ForgetPassword3 extends StatefulWidget {
  ForgetPassword3({super.key, required this.userName});
  String userName;
  @override
  State<ForgetPassword3> createState() => _ForgetPassword3State();
}

class _ForgetPassword3State extends State<ForgetPassword3> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  Auth forgetController = Get.put(Auth());

  late bool isLoading = false;

  final token = pref!.getString('token');
  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: const SpinKitFadingCircle(
        color: ColorsApp.primary_color,
        size: 60.0,
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                        child: Container(
                      height: 100.h,
                      width: 240.w,
                      alignment: Alignment.center,
                      child: TextApp.customText(
                          text:
                              'من فضللك قم بكتابة كلمة مرور جديدة مع التأكد من عدم علم اي شخص بها',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorsApp.primary_color,
                          textAlign: TextAlign.center),
                    )),
                    TextApp.smallheightSpace(20),
                    customTextFiled(
                      text: 'كلمة المرور',
                      prefix: SvgPicture.asset(
                        ImageApp.lock,
                        fit: BoxFit.scaleDown,
                      ),
                      controller: passwordController,
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'ادخل كلمة المرور';
                        }
                      },
                    ),
                    TextApp.smallheightSpace(50),
                    customTextFiled(
                      text: 'أعد كتابة كلمة المرور',
                      prefix: SvgPicture.asset(
                        ImageApp.lock,
                        fit: BoxFit.scaleDown,
                      ),
                      controller: repasswordController,
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'اعد كتابة كلمة المرور';
                        }
                      },
                    ),
                  ],
                ),
              ),
              TextApp.smallheightSpace(30),
              customButton(
                text: 'تأكيد',
                color: ColorsApp.primary_color,
                height: 56.h,
                onTap: () async {
                  if (passwordController.text.isNotEmpty &&
                      repasswordController.text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        forgetController
                            .changePassword(
                                UserName: widget.userName,
                                newPassword: passwordController.text.trim(),
                                repeatNewPassword:
                                    repasswordController.text.trim(),
                                token: token!)
                            .then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      });
                    });
                  } else if (passwordController.text !=
                      repasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'كلمة المرور غير متطابقة',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'tajwal',
                            color: Colors.white),
                      ),
                    ));
                  }
                },
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
