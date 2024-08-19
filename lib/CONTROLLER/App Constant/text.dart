import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/colors.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextApp {
  static Widget customText(
      {required String text,
      required FontWeight fontWeight,
      required double fontSize,
      required Color color,
      TextAlign? textAlign,
      double? height,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'tajwal',
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          color: color,
          height: height),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
    );
  }

  static Widget smallheightSpace(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  static Widget smallwidthSpace(double width) {
    return SizedBox(
      width: width.w,
    );
  }

  static List<AudioWaveBar> audioBar = [
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.2, color: Colors.white),
    AudioWaveBar(heightFactor: 0.1, color: Colors.white),
    AudioWaveBar(heightFactor: 0.3, color: Colors.white),
    AudioWaveBar(heightFactor: 0.7, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
    AudioWaveBar(heightFactor: 0.4, color: Colors.white),
  ];
  static List<AudioWaveBar> audioBar2 = [
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.2, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.1, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.3, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.7, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
    AudioWaveBar(heightFactor: 0.4, color: ColorsApp.primary_color),
  ];
}
