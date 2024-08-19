// import 'package:audio_wave/audio_wave.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:voice_message_package/voice_message_package.dart';
// import '../../../../CONTROLLER/App Constant/colors.dart';
// import '../../../../CONTROLLER/App Constant/text.dart';
// import '../../../../CONTROLLER/Chat/send_audio.dart';

// class ShowRecord extends StatefulWidget {
//   ShowRecord({super.key, required this.isPlaying, required this.sendAudioChat});
//   bool isPlaying;
//   VoidCallback sendAudioChat;
//   @override
//   State<ShowRecord> createState() => _ShowRecordState();
// }

// class _ShowRecordState extends State<ShowRecord> {
//   SendAudio sendAudio = Get.put(SendAudio());
//   final audioPlayer = AudioPlayer();

//   @override
//   Widget build(BuildContext context) {
//     return sendAudio.audioFile == null
//         ? const SizedBox()
//         : !sendAudio.isRecorderReady
//             ? const SizedBox()
//             : Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: ColorsApp.primary_color,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     VoiceMessage(
//                       audioSrc: sendAudio.audioFile!.path,
//                       contactBgColor: Color(0xffF6F6F6),
//                       contactCircleColor: ColorsApp.primary_color,
//                       contactFgColor: ColorsApp.primary_color,
//                       contactPlayIconBgColor: ColorsApp.primary_color,
//                       contactPlayIconColor: Colors.white,
//                       radius: 8.0,
//                       mePlayIconColor: ColorsApp.primary_color,
//                       meBgColor: ColorsApp.primary_color,
//                       meFgColor: Colors.white,
//                       played: false, // To show played badge or not.
//                       me: true, // Set message side.
//                       onPlay: () {}, // Do something when voice played.
//                     ),
//                     TextButton(
//                         onPressed: widget.sendAudioChat,
//                         child: TextApp.customText(
//                             text: 'إرسال',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12.sp,
//                             color: Colors.white))
//                   ],
//                 ),
//               );
//   }
// }
