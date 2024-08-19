// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:voice_message_package/voice_message_package.dart';
// import '../../../../CONTROLLER/App Constant/colors.dart';
// import '../../../../CONTROLLER/App Constant/text.dart';
// import '../../../../CONTROLLER/Home Nav/methods.dart';
// import '../expanded_image.dart';
// import 'package:path_provider/path_provider.dart';

// class StudentChat extends StatefulWidget {
//   StudentChat(
//       {Key? key,
//       required this.text,
//       required this.underText,
//       required this.isMe,
//       required this.readIcon,
//       required this.map,
//       required this.map2})
//       : super(key: key);
//   String text;
//   String underText;
//   bool isMe = true;
//   String map;
//   String map2;
//   String readIcon;

//   @override
//   State<StudentChat> createState() => _StudentChatState();
// }

// class _StudentChatState extends State<StudentChat> {
//   final audioPlayer = AudioPlayer();
//   Methods methods = Get.put(Methods());

//   bool isPlaying = false;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment:
//           widget.isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
//       crossAxisAlignment:
//           widget.isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
//       children: [
//         Column(
//           mainAxisAlignment:
//               widget.isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
//           crossAxisAlignment:
//               widget.isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
//           children: [
//             if (widget.map == 'text')
//               IntrinsicWidth(
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   constraints: BoxConstraints(maxWidth: 250.w, minWidth: 80.w),
//                   alignment: widget.isMe
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   decoration: BoxDecoration(
//                       color: widget.isMe
//                           ? ColorsApp.primary_color
//                           : Color(0xffF6F6F6),
//                       borderRadius: widget.isMe
//                           ? const BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               bottomRight: Radius.circular(8),
//                               bottomLeft: Radius.circular(8))
//                           : const BorderRadius.only(
//                               topRight: Radius.circular(8),
//                               bottomRight: Radius.circular(8),
//                               bottomLeft: Radius.circular(8))),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: widget.isMe
//                         ? CrossAxisAlignment.start
//                         : CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         widget.text,
//                         style: TextStyle(
//                             color: widget.isMe
//                                 ? Colors.white
//                                 : ColorsApp.primary_color,
//                             fontSize: 14.sp,
//                             fontFamily: 'tajwal'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             if (widget.map == 'audio')
//               VoiceMessage(
//                 audioSrc: widget.text,
//                 contactBgColor: Color(0xffF6F6F6),
//                 contactCircleColor: ColorsApp.primary_color,
//                 contactFgColor: ColorsApp.primary_color,
//                 contactPlayIconBgColor: ColorsApp.primary_color,
//                 contactPlayIconColor: Colors.white,
//                 radius: 8.0,
//                 mePlayIconColor: ColorsApp.primary_color,
//                 meBgColor: ColorsApp.primary_color,
//                 meFgColor: Colors.white,
//                 played: false, // To show played badge or not.
//                 me: widget.isMe ? true : false, // Set message side.
//                 onPlay: () {}, // Do something when voice played.
//               ),
//             TextApp.smallheightSpace(10),
//             if (widget.map == 'image')
//               GestureDetector(
//                 onTap: () {
//                   Get.to(() => ExpandedImage(
//                         image: widget.map2,
//                       ));
//                 },
//                 child: Container(
//                   height: 170.h,
//                   width: 170.w,
//                   padding: const EdgeInsets.all(5),
//                   margin: const EdgeInsets.only(bottom: 10),
//                   alignment: widget.isMe
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   decoration: BoxDecoration(
//                       color: widget.isMe
//                           ? ColorsApp.primary_color
//                           : Colors.grey.shade400,
//                       borderRadius: widget.isMe
//                           ? const BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               bottomRight: Radius.circular(8),
//                               bottomLeft: Radius.circular(8))
//                           : const BorderRadius.only(
//                               topRight: Radius.circular(8),
//                               bottomRight: Radius.circular(8),
//                               bottomLeft: Radius.circular(8))),
//                   child: Container(
//                     height: 160.h,
//                     width: 160.w,
//                     alignment: widget.map2 != "" ? null : Alignment.center,
//                     child: widget.map2 != ""
//                         ? Image.network(
//                             widget.map2,
//                             fit: BoxFit.cover,
//                           )
//                         : const CircularProgressIndicator(),
//                   ),
//                 ),
//               ),
//             if (widget.map == 'file')
//               widget.text.split('?').first.split('.').last == 'pdf'
//                   ? GestureDetector(
//                       onTap: () {
//                         methods.DownloadFile(fileUrl: widget.text);
//                       },
//                       child: Container(
//                         height: 78.h,
//                         width: 295.w,
//                         margin: EdgeInsets.only(
//                             top: 10.h, bottom: 10.h, right: 10.w),
//                         padding: EdgeInsets.only(right: 10.w),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(
//                             color: Colors.grey.shade300,
//                             width: 1,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 66.h,
//                               width: 66.w,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: ColorsApp.primary_color,
//                               ),
//                               child: const Icon(Icons.file_copy,
//                                   color: Colors.white),
//                             ),
//                             SizedBox(
//                               width: 16.w,
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 widget.isMe
//                                     ? Text(
//                                         'مرفق',
//                                         style: TextStyle(
//                                             color: ColorsApp.primary_color,
//                                             fontSize: 13.sp,
//                                             fontFamily: 'tajwal'),
//                                       )
//                                     : Text(
//                                         'مرفق',
//                                         style: TextStyle(
//                                             color: ColorsApp.primary_color,
//                                             fontSize: 13.sp,
//                                             fontFamily: 'tajwal'),
//                                       ),
//                                 SizedBox(
//                                   height: 10.h,
//                                 ),
//                                 Text(
//                                   'انقر لتحميل الملف',
//                                   style: TextStyle(
//                                       color: ColorsApp.primary_color,
//                                       fontSize: 12.sp,
//                                       fontFamily: 'tajwal'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   : GestureDetector(
//                       onTap: () {
//                         Get.to(() => ExpandedImage(
//                               image: widget.map2,
//                             ));
//                       },
//                       child: Container(
//                         height: 170.h,
//                         width: 170.w,
//                         padding: const EdgeInsets.all(3),
//                         alignment: widget.isMe
//                             ? Alignment.centerRight
//                             : Alignment.centerLeft,
//                         decoration: BoxDecoration(
//                             color: widget.isMe
//                                 ? ColorsApp.primary_color
//                                 : Colors.grey.shade400,
//                             borderRadius: widget.isMe
//                                 ? const BorderRadius.only(
//                                     topLeft: Radius.circular(8),
//                                     bottomRight: Radius.circular(8),
//                                     bottomLeft: Radius.circular(8))
//                                 : const BorderRadius.only(
//                                     topRight: Radius.circular(8),
//                                     bottomRight: Radius.circular(8),
//                                     bottomLeft: Radius.circular(8))),
//                         child: Container(
//                           height: 170.h,
//                           width: 170.w,
//                           alignment:
//                               widget.map2 != "" ? null : Alignment.center,
//                           child: widget.map2 != ""
//                               ? Image.network(
//                                   widget.map2,
//                                   fit: BoxFit.cover,
//                                 )
//                               : const CircularProgressIndicator(),
//                         ),
//                       ),
//                     ),
//             Row(
//               children: [
//                 widget.isMe
//                     ? SvgPicture.asset(
//                         widget.readIcon,
//                         fit: BoxFit.scaleDown,
//                       )
//                     : const SizedBox(),
//                 Container(
//                     padding:
//                         EdgeInsets.only(left: 10.h, bottom: 10.h, right: 10.w),
//                     child: Text(
//                       '${widget.underText} ',
//                       style: TextStyle(
//                           color: Colors.black45,
//                           fontSize: 12.sp,
//                           fontStyle: FontStyle.italic,
//                           fontFamily: 'tajwal'),
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
