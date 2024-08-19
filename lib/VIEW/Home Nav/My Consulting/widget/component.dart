import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';

class customConsultingCard extends StatelessWidget {
  customConsultingCard(
      {Key? key,
      required this.image,
      required this.text,
      required this.widget,
      required this.widget2,
      required this.sizedHeight,
      required this.consultingDate,
      required this.consultingNo,
      required this.consultingName,
      required this.price,
      required this.status})
      : super(key: key);
  String image;
  String text;
  Widget widget;
  Widget widget2;
  double sizedHeight;
  String consultingDate;
  String consultingNo;
  String consultingName;
  String price;
  String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 24.h, top: 5.h),
      padding:
          EdgeInsets.only(top: 16.h, left: 10.w, right: 10.w, bottom: 16.h),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp.customText(
                  text: consultingDate,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey.shade400),
              TextApp.customText(
                  text: consultingNo,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey.shade400),
            ],
          ),
          TextApp.smallheightSpace(13),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorsApp.default_color),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(image),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: sizedHeight,
                  ),
                ],
              ),
              TextApp.smallwidthSpace(7),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp.customText(
                      text: text,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorsApp.primary_color),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: consultingName,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: 'الحالة : $status',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: 'العرض المالي المقدم  : $price',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  widget,
                ],
              ),
            ],
          ),
          widget2,
        ],
      ),
    );
  }
}

class customConsultingCard2 extends StatelessWidget {
  customConsultingCard2(
      {Key? key,
      required this.height,
      required this.image,
      required this.text,
      required this.widget,
      required this.sizedHeight,
      required this.consultingDate,
      required this.consultingNo,
      required this.consultingName,
      required this.price,
      required this.status})
      : super(key: key);
  double height;
  String image;
  String text;
  Widget widget;
  double sizedHeight;
  String consultingDate;
  String consultingNo;
  String consultingName;
  String price;
  String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp.customText(
                  text: consultingDate,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey.shade400),
              TextApp.customText(
                  text: consultingNo,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey.shade400),
            ],
          ),
          TextApp.smallheightSpace(13),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.default_color),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(image),
                        fit: BoxFit.cover)),
              ),
              TextApp.smallwidthSpace(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp.customText(
                      text: text,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorsApp.primary_color),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: consultingName,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: 'الحالة : $status',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: 'العرض المالي الذي اقترحته : $price',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  widget,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
