import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';

class TermsAndCondition extends StatefulWidget {
  TermsAndCondition(
      {Key? key,
      required this.onTap,
      required this.isClicked,
      required this.onClick})
      : super(key: key);
  VoidCallback onTap;
  VoidCallback onClick;
  bool isClicked;

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.onClick,
                child: Container(
                  height: 18.h,
                  width: 18.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorsApp.primary_color, width: 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Container(
                    height: 18.h,
                    width: 18.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.isClicked == true
                          ? ColorsApp.primary_color
                          : Colors.white,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
              TextApp.smallwidthSpace(10),
              TextApp.customText(
                  text: 'الموافقة على',
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: ColorsApp.primary_color)
            ],
          ),
          GestureDetector(
              onTap: widget.onTap,
              child: TextApp.customText(
                  text: 'الشروط و الأحكام',
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: ColorsApp.default_color))
        ],
      ),
    );
  }
}
