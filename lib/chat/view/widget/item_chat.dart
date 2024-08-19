import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/colors.dart';
import 'package:al_mostashar_lawyer/chat/view/chat_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemChat1 extends StatelessWidget {
  const ItemChat1({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return chatModel.urlImage == null
        ? Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              margin: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 8,
                  right: MediaQuery.sizeOf(context).width * .2),
              decoration: BoxDecoration(
                  color: ColorsApp.primary_color,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(top: 6, right: 4),
                child: Text(
                  chatModel.message,
                  maxLines: 30,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200.w,
              margin: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 8,
                  right: MediaQuery.sizeOf(context).width * .2),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                  color: ColorsApp.primary_color,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: chatModel.urlImage!,
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  chatModel.message == ''
                      ? SizedBox(
                          height: 4,
                        )
                      : Text(
                          chatModel.message,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                ],
              ),
            ),
          );
  }
}
