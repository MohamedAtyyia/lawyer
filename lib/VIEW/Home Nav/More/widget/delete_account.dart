import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/image.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../../main.dart';
import '../../../Auth/login/login_screen.dart';
import '../../../Component/component.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController reasonController = TextEditingController();

  Auth deleteController = Get.put(Auth());

  late bool isLoading = false;

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
              text: 'حذف الحساب',
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
              TextApp.smallheightSpace(20),
              customTextFiled(
                text: 'رقم الهاتف',
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
              TextApp.smallheightSpace(20),
              customTextFiled4(
                text: 'سبب الحذف',
                maxline: 3,
                controller: reasonController,
                inputType: TextInputType.multiline,
                obscureText: false,
              ),
              TextApp.smallheightSpace(50),
              customButton(
                text: 'حذف الحساب',
                textColor: Colors.white,
                color: Colors.red,
                height: 56.h,
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 5), () {
                    setState(() {
                      deleteController
                          .deleteAccount(
                        id: Api.id,
                        phone: phoneController.text.trim(),
                        password: passwordController.text.trim(),
                        reason: reasonController.text.trim(),
                      )
                          .then((value) {
                        setState(() {
                          isLoading = false;
                          Get.offAll(() => LoginScreen());
                          pref!.remove('id');
                          pref!.remove('name');
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
    );
  }
}
