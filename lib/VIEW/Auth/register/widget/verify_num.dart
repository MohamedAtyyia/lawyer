import 'dart:async';
import 'dart:developer';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../../main.dart';
import '../../../Component/component.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key, required this.phone});
  final String phone;
  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final List<TextEditingController> _controllers =
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

  late bool isLoading = false;
  late String otp;

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

  Auth verifyPhoneController = Get.put(Auth());

  final phone = pref!.getString('phone');

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
    verifyPhoneController.sendVerificationOTP(widget.phone);

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
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
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
                    text: '\n${phone ?? ''}',
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
            Directionality(
              textDirection: TextDirection.ltr,
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 40.w,
                onChanged: (value) {
                  log('Value $value');
                },
                style: TextStyle(fontSize: 20.sp, fontFamily: 'Tajawal'),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  otp = pin;
                  setState(() {});
                },
              ),
            ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       TextApp.smallwidthSpace(10),
            //       _buildOTPTextField(_controllers[0], _focusNode1, _focusNode2),
            //       TextApp.smallwidthSpace(10),
            //       _buildOTPTextField(_controllers[1], _focusNode2, _focusNode3),
            //       TextApp.smallwidthSpace(10),
            //       _buildOTPTextField(_controllers[2], _focusNode3, _focusNode4),
            //       TextApp.smallwidthSpace(10),
            //       _buildOTPTextField(_controllers[3], _focusNode4, _focusNode5),
            //       TextApp.smallwidthSpace(10),
            //       _buildOTPTextField(_controllers[4], _focusNode5, _focusNode6),
            //       TextApp.smallwidthSpace(10),
            //       _buildOTPTextField(_controllers[5], _focusNode6, _focusNode6),
            //       TextApp.smallwidthSpace(10),
            //     ],
            //   ),
            // ),
            TextApp.smallheightSpace(20),
            customButton(
              text: 'التالي',
              color: ColorsApp.primary_color,
              textColor: Colors.white,
              height: 56.h,
              onTap: () {
                verifyPhoneController
                    .verifyPhone(
                  userName: phone!,
                  otp: otp,
                )
                    .then((value) {
                  if (value['status'] == 401 || value != 'Success') {
                    HandleError.showToasts(
                        msg: 'كود التحقق غير صحيح', color: Colors.red);
                  } else {
                    Get.offAll(() => LoginScreen());
                    timer!.cancel();
                  }
                });
              },
            ),
            TextApp.smallheightSpace(20),
            GestureDetector(
              onTap: () {
                timerRunning ? null : startTimer();
                verifyPhoneController.forgetPassword(
                    UserName: phone!, phoneNumber: phone!);
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
