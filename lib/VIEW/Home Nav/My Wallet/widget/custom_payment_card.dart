import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/image.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';


class customPaymentCard extends StatelessWidget {
 customPaymentCard({
    Key? key,
    required this.consultingDate,
    required this.consultingNum,
    required this.transPayment,
    required this.transactionDate,
    required this.transactionType
    }) : super(key: key);
  String transactionDate;
  String transactionType;
  String transPayment;
  String consultingNum;
  String consultingDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      padding: EdgeInsets.only(right: 20.w,left: 20.w,top: 10.h,bottom: 10.h),
      margin: EdgeInsets.only(right: 17.w,left: 17.w,top: 17.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 69.h,
            width: 65.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsApp.primary_color
            ),
            child: SvgPicture.asset(ImageApp.logo,fit: BoxFit.scaleDown,height: 40.h,),

          ),
          TextApp.smallwidthSpace(10),
          Expanded(
            child: Column(
             children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextApp.customText(text: transactionType, fontWeight: FontWeight.w700, fontSize: 15, color: ColorsApp.primary_color),
                  TextApp.customText(text: transactionDate, fontWeight: FontWeight.normal, fontSize: 10, color: ColorsApp.primary_color),
                ],
              ),
               TextApp.smallheightSpace(5),
               RichText(
                text:  TextSpan(
                  text: 'تم استلام $transPayment ريال سعودي في المحفظة نتيجة اتمام استشاره رقم',
                  style: const TextStyle(fontFamily: 'tajwal',fontWeight: FontWeight.w500,fontSize: 13, color: ColorsApp.primary_color),
                  children: [
                    TextSpan(
                      text: ' $consultingNum ',
                      style: const TextStyle(fontFamily: 'tajwal',fontWeight: FontWeight.w500,fontSize: 13, color: ColorsApp.default_color)
                    ),
                    TextSpan(
                      text: 'بتاريخ $consultingDate' ,
                      style: const TextStyle(fontFamily: 'tajwal',fontWeight: FontWeight.w500,fontSize: 13, color: ColorsApp.primary_color)
                    ),
                  ],
                )
                ),
             ],
            ),
          ),
        ],
      ),
    );
  }
}