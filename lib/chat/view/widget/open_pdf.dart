import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/colors.dart';
import 'package:al_mostashar_lawyer/chat/view/widget/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenPdf extends StatelessWidget {
  const OpenPdf(
      {super.key,
      required this.url,
      required this.mainAxisAlignment,
      required this.message});
  final String url;
  final String message;

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShowPdf(
                pdf: url,
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: 4,
              bottom: 4,
              left: 8,
              right: 8,
            ),
            alignment: Alignment.center,
            width: 150.w,
            height: 70,
            decoration: BoxDecoration(
                color: ColorsApp.primary_color,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 100.w,
                    child: Text(
                      url,
                      maxLines: 2,
                      style: TextStyle(color: Colors.white),
                    )),
                message == ''
                    ? SizedBox(
                        height: 4,
                      )
                    : Text(
                        message,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
