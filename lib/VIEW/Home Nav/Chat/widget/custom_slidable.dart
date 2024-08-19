import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';

class customSlidable extends StatelessWidget {
  customSlidable({
    Key? key,
    required this.Name,
    required this.image,
    required this.timeReamining,
    required this.lastMessage,
    required this.fontWeight,
    required this.onPressed,
  }) : super(key: key);
  String Name;
  String lastMessage;
  String image;
  String timeReamining;
  FontWeight fontWeight;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (val) {},
            borderRadius: BorderRadius.circular(12),
            backgroundColor: Colors.red,
            foregroundColor: Colors.red,
            // icon: GestureDetector(
            //   onTap: onPressed,
            //   child: Container(
            //     height: 50.h,
            //     width: 50.w,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       color: Colors.red,
            //     ),
            //     child: SvgPicture.asset(
            //       ImageApp.delete,
            //       fit: BoxFit.scaleDown,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            label: '',
          ),
        ],
      ),
      child: Container(
        height: 72.h,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 17.w, left: 17.w, bottom: 25.h),
        padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 6.h, bottom: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                TextApp.smallwidthSpace(5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: TextApp.customText(
                          text: Name,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          overflow: TextOverflow.ellipsis,
                          maxLine: 1,
                          color: ColorsApp.primary_color),
                    ),
                    SizedBox(
                      width: 150.w,
                      child: TextApp.customText(
                          text: lastMessage,
                          fontWeight: fontWeight,
                          fontSize: 13.sp,
                          color: ColorsApp.primary_color,
                          maxLine: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
            TextApp.smallwidthSpace(20),
            Expanded(
              child: CountdownTimer(
                endTime: int.parse(timeReamining),
                endWidget: TextApp.customText(
                    text: 'انتهت الإستشارة',
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: ColorsApp.default_color),
                textStyle: TextStyle(
                    fontFamily: 'tajwal',
                    fontSize: 12.sp,
                    color: ColorsApp.default_color,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
