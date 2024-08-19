import 'dart:async';
import 'dart:developer';

import 'package:al_mostashar_lawyer/VIEW/Auth/login/login_screen.dart';
import 'package:al_mostashar_lawyer/VIEW/Auth/register/widget/verify_num.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/home_nav.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:get/get.dart';

import '../../VIEW/On Boarding/on_boarding.dart';

class SplashController extends GetxController {
  getNextPage() async {
    Timer(const Duration(seconds: 4), () {
      Timer(
        const Duration(seconds: 4),
        () {
          var otp = pref?.getString('otpStatus') ?? '';

          var userId = pref!.getString('id');
          var skipOnBoarding = pref!.getBool('skipOnBoarding') ?? false;

          log('skipOnBoarding $skipOnBoarding');
          log('otpDone $otp');
          log('userId $userId');
          if (skipOnBoarding) {
            // otp == 'done' &&
            if (userId != null && otp != 'start') {
              Get.offAll(() => const HomeNav());
            } else {
              if (otp == 'start') {
                var email = pref!.getString('email') ?? '';
                var phone = pref!.getString('userName') ?? '';
                Get.offAll(
                  () => VerifyNumber(
                    phone: phone,

                    // email: email,
                  ),
                );
              } else {
                Get.offAll(() => LoginScreen());
              }
            }
          } else {
            Get.to(() => const OnBoardingScreen());
          }
          update();
        },
      );
      // Get.to(() => const OnBoardingScreen());
      // update();
    });
  }

  @override
  void onInit() {
    getNextPage();
    super.onInit();
  }
}
