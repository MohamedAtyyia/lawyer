import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';

class customProfileCard extends StatelessWidget {
  customProfileCard(
      {Key? key,
      required this.email,
      required this.userName,
      required this.widget,
      required this.changeImage,
      required this.verifiedWidget,
      required this.image})
      : super(key: key);
  String userName;
  String email;
  String image;
  Widget widget;
  Widget verifiedWidget;
  VoidCallback changeImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 17.w, top: 27.h, bottom: 18.h, right: 17.w),
      padding:
          EdgeInsets.only(right: 10.w, left: 10.w, top: 14.h, bottom: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: changeImage,
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorsApp.default_color),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                      bottom: -8, left: 10, right: 10, child: verifiedWidget),
                ],
              ),
              TextApp.smallwidthSpace(10),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp.customText(
                      text: userName,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: ColorsApp.primary_color,
                    ),
                    SizedBox(
                      width: 220.w,
                      child: TextApp.customText(
                        text: email,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: ColorsApp.primary_color,
                        overflow: TextOverflow.ellipsis,
                        maxLine: 1,
                      ),
                    ),
                  ],
                ),
              ),
              TextApp.smallwidthSpace(10),
              Icon(Icons.arrow_forward_ios,
                  color: Colors.grey.shade400, size: 15)
            ],
          ),
          TextApp.smallheightSpace(20),
          widget,
        ],
      ),
    );
  }
}
