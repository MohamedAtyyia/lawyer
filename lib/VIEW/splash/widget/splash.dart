import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../CONTROLLER/App Constant/image.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageApp.background),
          fit: BoxFit.fitWidth
        ),
      ),
      child: SvgPicture.asset(ImageApp.logoWhite),
    );
  }
}