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

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Auth authController = Get.put(Auth());
  late bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

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
            text: 'تغير كلمة المرور',
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
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 60.h,
                  child: TextApp.customText(
                      text:
                          'يجب ان يكون الرقم السري الخاص بك مكون من 8 حروف وأرقام ورمز واحد علي الاقل',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorsApp.primary_color,
                      height: 2.h),
                ),
                TextApp.smallheightSpace(60),
                customTextFiled(
                  text: 'ادخل كلمة المرور الحالية',
                  prefix: SvgPicture.asset(
                    ImageApp.lock,
                    fit: BoxFit.scaleDown,
                  ),
                  controller: oldPasswordController,
                  inputType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (val) {},
                ),
                TextApp.smallheightSpace(24),
                customTextFiled(
                  text: 'كلمة المرور الجديدة',
                  prefix: SvgPicture.asset(
                    ImageApp.lock,
                    fit: BoxFit.scaleDown,
                  ),
                  controller: newPasswordController,
                  inputType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (val) {},
                ),
                TextApp.smallheightSpace(24),
                customTextFiled(
                  text: 'أعد كتابة كلمة المرور',
                  prefix: SvgPicture.asset(
                    ImageApp.lock,
                    fit: BoxFit.scaleDown,
                  ),
                  controller: repasswordController,
                  inputType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (val) {},
                ),
                TextApp.smallheightSpace(52),
                customButton(
                    text: 'تعديل',
                    color: ColorsApp.primary_color,
                    textColor: Colors.white,
                    height: 56.h,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (oldPasswordController.text == null ||
                            oldPasswordController.text.isEmpty) {
                          return HandleError.showToasts(
                              msg: 'اكتب كلمة المرور القديمة',
                              color: ColorsApp.primary_color);
                        } else if (newPasswordController.text == null ||
                            newPasswordController.text.isEmpty) {
                          return HandleError.showToasts(
                              msg: 'اكتب كلمة المرور الجديدة',
                              color: ColorsApp.primary_color);
                        } else if (repasswordController.text == null ||
                            repasswordController.text.isEmpty) {
                          return HandleError.showToasts(
                              msg: 'اعد كتابة كلمة المرور',
                              color: ColorsApp.primary_color);
                        } else if (repasswordController.text !=
                            newPasswordController.text) {
                          return HandleError.showToasts(
                              msg: 'كلمة المرور غير متطابقة',
                              color: ColorsApp.primary_color);
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              authController
                                  .changePasswordWithoutToken(
                                UserName: Api.phone,
                                newPassword: newPasswordController.text.trim(),
                                repeatNewPassword:
                                    repasswordController.text.trim(),
                              )
                                  .then((value) {
                                setState(() {
                                  isLoading = false;
                                  if (value == null) {
                                    HandleError.showToasts(
                                        msg: 'لم يتم تأكيد الرقم عند التسجيل',
                                        color: Colors.red);
                                  } else {
                                    HandleError.showToasts(
                                        msg: 'تم تغيير كلمة المرور بنجاح',
                                        color: Colors.green);
                                    Get.back();
                                  }
                                });
                              });
                            });
                          });
                        }
                      } else {}
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
