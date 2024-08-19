import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../Forget Password/forget_password1.dart';

class Remember_Forget extends StatefulWidget {
   Remember_Forget({Key? key,required this.onTap,required this.color}) : super(key: key);
 VoidCallback onTap;
 Color color;
  @override
  State<Remember_Forget> createState() => _Remember_ForgetState();
}

class _Remember_ForgetState extends State<Remember_Forget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      padding: EdgeInsets.only(right: 10.w,left: 10.w),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 18.h,
                  width: 18.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsApp.primary_color,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Container(
                    height: 18.h,
                    width: 18.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.color,
                    ),
                    child: const Icon(Icons.check,color: Colors.white,size: 15,),
                  ),
                ),
              ),
              TextApp.smallwidthSpace(10),
              TextApp.customText(text: 'تذكرني', fontWeight: FontWeight.normal, fontSize: 12, color: ColorsApp.primary_color)
            ],
          ),
          GestureDetector(
            onTap: (){
              Get.to(()=> ForgetPassword1());
            },
            child: TextApp.customText(text: 'نسيت كلمة المرور ؟', fontWeight: FontWeight.normal, fontSize: 12, color: ColorsApp.primary_color))

        ],
      ),
    );
  }
}