import 'package:al_mostashar_lawyer/VIEW/splash/widget/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CONTROLLER/Splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Splash(),
    );
  }
}