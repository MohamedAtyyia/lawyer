import 'dart:async';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../CONTROLLER/App Constant/text.dart';
import '../../../CONTROLLER/Auth/Auth.dart';
import '../../Component/component.dart';

class ForgetPassword2 extends StatefulWidget {
  ForgetPassword2({super.key, required this.userName, required this.phone});
  String userName;
  String phone;

  @override
  State<ForgetPassword2> createState() => _ForgetPassword2State();
}

class _ForgetPassword2State extends State<ForgetPassword2> {
  Timer? timer;
  int remainingMinute = 180;
  bool timerRunning = false;
  void startTimer() {
    setState(() {
      timerRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingMinute > 0) {
          remainingMinute--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
      setState(() {
        timerRunning = false;
        remainingMinute = 180;
      });
    }
  }

  List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  TextEditingController phoneController = TextEditingController();

  TextEditingController phoneController2 = TextEditingController();

  TextEditingController phoneController3 = TextEditingController();

  TextEditingController phoneController4 = TextEditingController();

  TextEditingController phoneController5 = TextEditingController();

  TextEditingController phoneController6 = TextEditingController();
  bool _field2Enabled = false;
  bool _field3Enabled = false;
  bool _field4Enabled = false;
  bool _field5Enabled = false;
  bool _field6Enabled = false;

  Auth forgetController = Get.put(Auth());

  late bool isLoading = false;
  @override
  void initState() {
    _controllers[0].addListener(() {
      setState(() {
        _field2Enabled = _controllers[0].text.isNotEmpty;
      });
    });
    _controllers[1].addListener(() {
      setState(() {
        _field3Enabled = _controllers[1].text.isNotEmpty;
      });
    });
    _controllers[2].addListener(() {
      setState(() {
        _field4Enabled = _controllers[2].text.isNotEmpty;
      });
    });
    _controllers[3].addListener(() {
      setState(() {
        _field5Enabled = _controllers[3].text.isNotEmpty;
      });
    });
    _controllers[4].addListener(() {
      setState(() {
        _field6Enabled = _controllers[4].text.isNotEmpty;
      });
    });
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    stopTimer();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    super.dispose();
  }

  void _nextField({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  Widget _buildOTPTextField(TextEditingController controller,
      FocusNode focusNode, FocusNode nextFocusNode) {
    return SizedBox(
      width: 40.w,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        obscureText: false,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        cursorColor: ColorsApp.primary_color,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 18.sp, fontFamily: 'tajwal'),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorsApp.default_color),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorsApp.primary_color),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorsApp.primary_color),
          ),
        ),
        onChanged: (value) {
          _nextField(value: value, focusNode: nextFocusNode);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds: remainingMinute);
    String timerText = remainingMinute > 0
        ? '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}'
        : '3:00';
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
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                            fontFamily: 'tajwal',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: ColorsApp.primary_color),
                        text: 'أدخل كود التأكيد المرسل لك \n رقم الهاتف',
                        children: [
                          TextSpan(
                            text: '\n${widget.phone}',
                            style: const TextStyle(
                                fontFamily: 'tajwal',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorsApp.primary_color),
                          ),
                        ],
                      ),
                    ),
                    TextApp.smallheightSpace(60),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextApp.smallwidthSpace(10),
                          _buildOTPTextField(
                              _controllers[0], _focusNode1, _focusNode2),
                          TextApp.smallwidthSpace(10),
                          _buildOTPTextField(
                              _controllers[1], _focusNode2, _focusNode3),
                          TextApp.smallwidthSpace(10),
                          _buildOTPTextField(
                              _controllers[2], _focusNode3, _focusNode4),
                          TextApp.smallwidthSpace(10),
                          _buildOTPTextField(
                              _controllers[3], _focusNode4, _focusNode5),
                          TextApp.smallwidthSpace(10),
                          _buildOTPTextField(
                              _controllers[4], _focusNode5, _focusNode6),
                          TextApp.smallwidthSpace(10),
                          _buildOTPTextField(
                              _controllers[5], _focusNode6, _focusNode6),
                          TextApp.smallwidthSpace(10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              customButton(
                text: 'التالي',
                color: ColorsApp.primary_color,
                height: 56.h,
                onTap: () async {
                  if (_controllers[0].text.isNotEmpty &&
                      _controllers[1].text.isNotEmpty &&
                      _controllers[2].text.isNotEmpty &&
                      _controllers[3].text.isNotEmpty &&
                      _controllers[4].text.isNotEmpty &&
                      _controllers[5].text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        forgetController
                            .verifyPhone2(
                          userName: widget.phone,
                          otp: _controllers[5].text +
                              _controllers[4].text +
                              _controllers[3].text +
                              _controllers[2].text +
                              _controllers[1].text +
                              _controllers[0].text,
                        )
                            .then((value) {
                          setState(() {
                            if (value == null) {
                              isLoading = false;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'كود التحقق غير صحيح',
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
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'ادخل ال OTP المرسل الى رقم جوالك',
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
              TextApp.smallheightSpace(20),
              GestureDetector(
                onTap: () {
                  timerRunning ? null : startTimer();
                  forgetController.forgetPassword(
                      UserName: widget.phone, phoneNumber: widget.phone);
                },
                child: Center(
                    child: TextApp.customText(
                        text: 'لم أستلم الكود ($timerText)',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: ColorsApp.primary_color)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
