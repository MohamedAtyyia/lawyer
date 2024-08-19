import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/Auth/Auth.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/register/widget/terms_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/image.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../About/terms_condition copy.dart';
import '../../../Component/component.dart';
import '../../login/login_screen.dart';
import '../../login/widget/dont_have_acc.dart';

TextEditingController registerPhoneController = TextEditingController();

class PersonalInfo extends StatefulWidget {
  PersonalInfo({Key? key, required this.pageController}) : super(key: key);
  PageController pageController = PageController();

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController nameController = TextEditingController();

  TextEditingController familyController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  Auth registerController = Get.put(Auth());

  final GlobalKey<FormState> formKey = GlobalKey();

  late bool isLoading = false;

  bool isClicked = false;

  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              customTextFiled(
                text: 'الهاتف',
                prefix: SvgPicture.asset(
                  ImageApp.phone,
                  fit: BoxFit.scaleDown,
                ),
                controller: registerPhoneController,
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
                          return 'ادخل اسمك الاول ';
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
                          return 'ادخل اسم العائلة ';
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
                controller: emailController,
                inputType: TextInputType.emailAddress,
                obscureText: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'ادخل البريد الإلكتروني ';
                  }
                  return null;
                },
              ),
              TextApp.smallheightSpace(20),
              customTextFiled4(
                text:
                    'اكتب نبذة قصيرة عنك , مثال : محامي متخصص في القانون و لديه ثلاث سنوات خبرة',
                maxline: 8,
                controller: descController,
                inputType: TextInputType.multiline,
                obscureText: false,
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
                  return null;
                },
              ),
              TextApp.smallheightSpace(20),
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
                  } else if (val != passwordController.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
              ),
              TextApp.smallheightSpace(20),
              TermsAndCondition(
                isClicked: isClicked,
                onClick: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                onTap: () {
                  Get.to(() => TermsAndConditionScreen());
                },
              ),
              TextApp.smallheightSpace(50),
              customButton(
                text: 'التالي',
                color: ColorsApp.primary_color,
                textColor: Colors.white,
                height: 56.h,
                onTap: () async {
                  if (registerPhoneController.text.isEmpty) {
                    HandleError.showToasts(
                        msg: 'ادخل رقم الهاتف', color: Colors.red);
                  } else if (nameController.text.isEmpty) {
                    HandleError.showToasts(msg: 'ادخل اسمك', color: Colors.red);
                  } else if (familyController.text.isEmpty) {
                    HandleError.showToasts(
                        msg: 'ادخل اسم العائلة', color: Colors.red);
                  } else if (emailController.text.isEmpty) {
                    HandleError.showToasts(
                        msg: 'ادخل الإيميل الخاص بك ', color: Colors.red);
                  } else if (descController.text.isEmpty) {
                    HandleError.showToasts(
                        msg: 'اكتب نبذة قصيرة عنك', color: Colors.red);
                  } else if (passwordController.text.isEmpty) {
                    HandleError.showToasts(
                        msg: 'ادخل كلمة المرور', color: Colors.red);
                  } else if (repasswordController.text.isEmpty) {
                    HandleError.showToasts(
                        msg: 'اعد كتابة كلمة المرور', color: Colors.red);
                  } else if (passwordController.text !=
                      repasswordController.text) {
                    HandleError.showToasts(
                        msg: 'كلمة المرور غير متطابقة', color: Colors.red);
                  } else if (isClicked == false) {
                    HandleError.showToasts(
                        msg: 'اقبل شروط الخصوصية', color: Colors.red);
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        registerController
                            .register(
                          userName: registerPhoneController.text.trim(),
                          firstName: nameController.text.trim(),
                          familyName: familyController.text.trim(),
                          email: emailController.text.trim(),
                          desc: descController.text.trim(),
                          password: passwordController.text.trim(),
                          phone: registerPhoneController.text.trim(),
                        )
                            .then((value) {
                          setState(() {
                            isLoading = false;
                            if (value == null) {
                              HandleError.showToasts(
                                  msg: 'الحساب موجود بالفعل',
                                  color: Colors.red);
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
