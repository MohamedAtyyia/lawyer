import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';

class HaveAccount extends StatelessWidget {
   HaveAccount({Key? key,required this.onTap,required this.text1,required this.text2}) : super(key: key);
   String text1;
   String text2;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextApp.customText(text: text1, fontWeight: FontWeight.normal, fontSize: 16, color: ColorsApp.primary_color),
          TextApp.smallwidthSpace(5),
          GestureDetector(
            onTap: onTap,
            child: TextApp.customText(text: text2, fontWeight: FontWeight.bold, fontSize: 16, color: ColorsApp.default_color)
            ),

        ],
      ),
    );
  }
}