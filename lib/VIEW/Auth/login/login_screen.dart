import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/login/widget/dont_have_acc.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/login/widget/remember&forget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../CONTROLLER/App Constant/api.dart';
import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../CONTROLLER/App Constant/image.dart';
import '../../../CONTROLLER/App Constant/text.dart';
import '../../../CONTROLLER/Auth/Auth.dart';
import '../../../main.dart';
import '../../Component/component.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Auth loginController = Get.put(Auth());
  late bool isLoading = false;
  bool isClicked = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // initConnectivity();

    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    phoneController.text = Api.user;
    passwordController.text = Api.pass;
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  // Future<void> initConnectivity() async {
  //   late ConnectivityResult result;
  //   try {
  //     // result = await _connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     log('Couldn\'t check connectivity status', error: e);
  //     return;
  //   }
  //   if (!mounted) {
  //     return Future.value(null);
  //   }

  //   // return _updateConnectionStatus(result);
  // }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   setState(() {
  //     _connectionStatus = result;
  //   });
  // }

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
              text: 'تسجيل الدخول',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black),
          centerTitle: true,
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
                      return 'ادخل كلمة المرور ';
                    }
                  },
                ),
                TextApp.smallheightSpace(10),
                Remember_Forget(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                      Api.click = !Api.click;
                      pref!.setBool('click', isClicked);
                    });
                    if (isClicked == true) {
                      pref!.setString('userName', phoneController.text);
                      pref!.setString('pass', passwordController.text);
                    } else {
                      pref!.remove('userName');
                      pref!.remove('pass');
                      pref!.remove('click');
                    }
                  },
                  color: Api.click == true
                      ? ColorsApp.primary_color
                      : Colors.white,
                ),
                TextApp.smallheightSpace(50),
                customButton(
                  text: 'تسجيل الدخول',
                  color: ColorsApp.primary_color,
                  textColor: Colors.white,
                  height: 56.h,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          loginController
                              .login(
                                  userName: phoneController.text.trim(),
                                  password: passwordController.text.trim())
                              .then((value) {
                            if (value == null) {
                              HandleError.showToasts(
                                  msg: 'اسم المستخدم او كلمة المرور غير صحيحة',
                                  color: Colors.red);
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              loginController
                                  .getToken(
                                    token: myFcmToken,
                                    userID: value['id'],
                                  )
                                  .then((value) {});
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                        });
                      });
                    }

                    // if (_connectionStatus == ConnectivityResult.none) {
                    //   HandleError.showToasts(+
                    //       msg: 'لا يوجد انترنت', color: Colors.red);
                    // } else {
                    //   if (formKey.currentState!.validate()) {
                    //     setState(() {
                    //       isLoading = true;
                    //     });
                    //     await Future.delayed(const Duration(seconds: 1), () {
                    //       setState(() {
                    //         loginController
                    //             .login(
                    //                 userName: phoneController.text.trim(),
                    //                 password: passwordController.text.trim())
                    //             .then((value) {
                    //           if (value == null) {
                    //             HandleError.showToasts(
                    //                 msg:
                    //                     'اسم المستخدم او كلمة المرور غير صحيحة',
                    //                 color: Colors.red);
                    //             setState(() {
                    //               isLoading = false;
                    //             });
                    //           } else {
                    //             loginController
                    //                 .getToken(
                    //                   token: myFcmToken,
                    //                   userID: value['id'],
                    //                 )
                    //                 .then((value) {});
                    //             setState(() {
                    //               isLoading = false;
                    //             });
                    //           }
                    //         });
                    //       });
                    //     });

                    //   } else {}
                    // }
                  },
                ),
                TextApp.smallheightSpace(50),
                HaveAccount(
                  text1: 'ليس لديك حساب ؟',
                  text2: 'انشأ حساب الأن',
                  onTap: () {
                    Get.to(() => RegisterScreen());
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
