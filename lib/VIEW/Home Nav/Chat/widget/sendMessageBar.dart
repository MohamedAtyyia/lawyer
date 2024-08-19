import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/image.dart';
import '../../../../CONTROLLER/App Constant/text.dart';

class customSenderBar extends StatelessWidget {
  customSenderBar({
    Key? key,
    required this.messageController,
    required this.sendImage,
    required this.sendMessage,
    required this.sendFile,
    required this.sendAudio,
    required this.micColor,
  }) : super(key: key);
  TextEditingController messageController = TextEditingController();
  VoidCallback sendMessage;
  VoidCallback sendImage;
  VoidCallback sendFile;
  VoidCallback sendAudio;
  Color micColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      margin: EdgeInsets.only(left: 17.w, right: 17.w, bottom: 5.h),
      child: SafeArea(
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: sendMessage,
              child: Container(
                height: 44.h,
                width: 44.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorsApp.primary_color,
                ),
                child: SvgPicture.asset(
                  ImageApp.send,
                  color: Colors.white,
                ),
              ),
            ),
            TextApp.smallwidthSpace(15),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  maxLines: null,
                  controller: messageController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                      fontFamily: 'tajwal',
                      fontSize: 14.sp,
                      color: ColorsApp.primary_color),
                  decoration: InputDecoration(
                    hintText: 'أكتب رسالتك هنا',
                    hintStyle: TextStyle(
                        fontFamily: 'tajwal',
                        fontSize: 13,
                        color: Colors.grey.shade300),
                    suffixIcon: GestureDetector(
                      onTap: sendFile,
                      child: SvgPicture.asset(
                        ImageApp.attach,
                        fit: BoxFit.scaleDown,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      onTap: sendAudio,
                      child: SvgPicture.asset(
                        ImageApp.mic,
                        fit: BoxFit.scaleDown,
                        color: micColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextApp.smallwidthSpace(10),
            GestureDetector(
              onTap: sendImage,
              child: Container(
                height: 44.h,
                width: 44.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.camera_enhance_outlined,
                  color: ColorsApp.primary_color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
