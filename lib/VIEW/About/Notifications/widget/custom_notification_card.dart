import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';

class customNotificationCard extends StatelessWidget {
  customNotificationCard(
      {Key? key,
      required this.date,
      required this.subject,
      required this.title})
      : super(key: key);
  String date;
  String subject;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 18.h, right: 17.w, left: 17.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextApp.customText(
                  text: date,
                  fontWeight: FontWeight.w600,
                  fontSize: 9,
                  color: Colors.grey.shade300),
            ],
          ),
          TextApp.customText(
              text: subject,
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: ColorsApp.primary_color),
          TextApp.smallheightSpace(10),
          SizedBox(
              width: 350.w,
              child: TextApp.customText(
                  text: title,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Colors.grey.shade300)),
        ],
      ),
    );
  }
}
