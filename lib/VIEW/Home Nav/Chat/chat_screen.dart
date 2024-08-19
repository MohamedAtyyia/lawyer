// import 'dart:developer';
// import 'dart:io';
// import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Chat/widget/sendMessageBar.dart';
// import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Chat/widget/show_record.dart';
// import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Chat/widget/stream_recorder.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../CONTROLLER/App Constant/api.dart';
// import '../../../CONTROLLER/App Constant/colors.dart';
// import '../../../CONTROLLER/App Constant/handle_error.dart';
// import '../../../CONTROLLER/App Constant/image.dart';
// import '../../../CONTROLLER/Chat/Notification/push_notification.dart';
// import '../../../CONTROLLER/Chat/save_chat.dart';
// import '../../../CONTROLLER/Chat/send_audio.dart';
// import '../../../CONTROLLER/Chat/send_file.dart';
// import '../../../CONTROLLER/Chat/send_image.dart';
// import '../../../CONTROLLER/Chat/send_message.dart';
// import 'widget/appBar.dart';
// import 'widget/student_chat.dart';

// class ChatScreen extends StatefulWidget {
//   ChatScreen({
//     Key? key,
//     required this.serviceID,
//     required this.reciverID,
//     required this.timeReamining,
//     required this.requesterName,
//     required this.reciverName,
//     required this.reciverImage,
//     required this.requesterImage,
//     required this.resepFcmToken,
//     required this.pageNumber,
//   }) : super(key: key);
//   String serviceID;
//   String reciverID;
//   String timeReamining;
//   String requesterName;
//   String reciverImage;
//   String requesterImage;
//   String reciverName;
//   String resepFcmToken;
//   int pageNumber;

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   SendMessages sendMessage = Get.put(SendMessages());
//   SendImage sendImage = Get.put(SendImage());
//   SendFile sendFile = Get.put(SendFile());
//   SendAudio sendAudio = Get.put(SendAudio());
//   SaveChat saveChat = Get.put(SaveChat());

//   String id = Api.id;
//   final items = List<int>.generate(1, (i) => i + 1);

//   final _firestore = FirebaseFirestore.instance;
//   TextEditingController controller = TextEditingController();
//   AudioPlayer audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   String? fcmToken;
//   createNoti() {
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: 1,
//             channelKey: 'schedule',
//             title: 'تذكير',
//             body: 'متبقي 5 دقائق على انتهاء الإستشارة',
//             criticalAlert: true,
//             fullScreenIntent: true,
//             autoDismissible: true,
//             category: NotificationCategory.Reminder),
//         schedule: NotificationCalendar.fromDate(
//             repeats: false,
//             date: DateTime.fromMillisecondsSinceEpoch(
//                     int.parse(widget.timeReamining))
//                 .subtract(const Duration(hours: 0, minutes: 5, seconds: 0))));
//   }

//   @override
//   void initState() {
//     sendAudio.initRecording();
//     HandleError.toast.init(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: customAppBar(
//         requesterName: widget.requesterName,
//         timeReamining: widget.timeReamining,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore
//                   .collection('Chat')
//                   .doc(widget.serviceID)
//                   .collection('messages')
//                   .orderBy('time')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   List<StudentChat> messageWidgets = [];
//                   final messages = snapshot.data!.docs.reversed;
//                   for (var message in messages) {
//                     final messageSender = message.get('senderID');
//                     final messageText = message.get('messageText');
//                     final messageType = message.get('type');
//                     fcmToken = message.get('fcmToken');
//                     final messageTime = message.get('time').toDate();
//                     final messageWidget = StudentChat(
//                       text: messageText,
//                       map: messageType,
//                       map2: messageText,
//                       underText: DateFormat('HH:mm').format(messageTime),
//                       isMe: id == messageSender,
//                       readIcon: message.get('isRead') == false
//                           ? ImageApp.unread
//                           : ImageApp.read,
//                     );
//                     messageWidgets.add(messageWidget);
//                     audioPlayer
//                         .play(AssetSource('images/recived_message.mpeg'));
//                     _firestore
//                         .collection('Chat')
//                         .doc(widget.serviceID)
//                         .collection('messages')
//                         .where('senderID', isNotEqualTo: Api.id)
//                         .get()
//                         .then((QuerySnapshot querySnapshot) {
//                       querySnapshot.docs
//                           .forEach((DocumentSnapshot documentSnapshot) {
//                         final String messageId = documentSnapshot.id;
//                         final DocumentReference messageRef = _firestore
//                             .collection('Chat')
//                             .doc(widget.serviceID)
//                             .collection('messages')
//                             .doc(messageId);
//                         messageRef
//                             .update({
//                               "isRead": true,
//                             })
//                             .then((value) {})
//                             .catchError((error) {
//                               log(error);
//                             });
//                       });
//                     });
//                   }
//                   return ListView(
//                       reverse: true,
//                       padding: const EdgeInsets.all(20),
//                       physics: const BouncingScrollPhysics(),
//                       children: messageWidgets);
//                 } else if (snapshot.hasError) {
//                   HandleError.checkInternetConnection;
//                 }
//                 return HandleError.circleIndicator2;
//               },
//             ),
//           ),
//           DateTime.now().millisecondsSinceEpoch >
//                   int.parse(widget.timeReamining)
//               ? const SizedBox()
//               : customSenderBar(
//                   messageController: controller,
//                   sendMessage: () async {
//                     if (controller.text.isNotEmpty) {
//                       sendMessage
//                           .sendMessage(
//                         serviceID: widget.serviceID,
//                         reciverID: widget.reciverID,
//                         reciverImage: widget.reciverImage,
//                         requesterImage: widget.requesterImage,
//                         senderName: widget.requesterName,
//                         reciverName: widget.reciverName,
//                         timeToFinish: widget.timeReamining,
//                         messageText: controller.text.trim(),
//                         resepFcmToken: widget.resepFcmToken,
//                       )
//                           .then((val) {
//                         saveChat.sendMessage(
//                           ConsultingId: widget.serviceID,
//                           RecieverId: widget.reciverID,
//                           SenderId: Api.id,
//                           SenderText: controller.text.trim(),
//                           RequestAudioo: null,
//                           RequestDocumentt: null,
//                         );
//                         createNoti();
//                         APIs.sendPushNotification(
//                           fcmToken: widget.resepFcmToken,
//                           channelID: '1',
//                           title: widget.requesterName,
//                           msg: controller.text,
//                         ).then((value) {
//                           controller.clear();
//                           audioPlayer
//                               .play(AssetSource('images/send_message.mpeg'));
//                         });
//                       });
//                     } else {}
//                   },
//                   sendImage: () {
//                     sendImage
//                         .imgFromGallery(
//                       serviceID: widget.serviceID,
//                       reciverID: widget.reciverID,
//                       reciverImage: widget.reciverImage,
//                       requesterImage: widget.requesterImage,
//                       requesterName: widget.requesterName,
//                       reciverName: widget.reciverName,
//                       timeToFinish: widget.timeReamining,
//                       resepFcmToken: widget.resepFcmToken,
//                     )
//                         .then((val) {
//                       APIs.sendPushNotification(
//                         fcmToken: widget.resepFcmToken,
//                         channelID: '1',
//                         title: widget.requesterName,
//                         msg: 'صورة',
//                       ).then((value) {
//                         controller.clear();
//                         audioPlayer
//                             .play(AssetSource('images/send_message.mpeg'));
//                       });
//                     });
//                   },
//                   sendFile: () {
//                     sendFile.sendFile().then((value) {
//                       sendFile.uploadFile(
//                         serviceID: widget.serviceID,
//                         reciverID: widget.reciverID,
//                         reciverImage: widget.reciverImage,
//                         requesterImage: widget.requesterImage,
//                         timeToFinish: widget.timeReamining,
//                         resepFcmToken: widget.resepFcmToken,
//                         requesterName: widget.requesterName,
//                         reciverName: widget.reciverName,
//                       );
//                     }).then((val) {
//                       APIs.sendPushNotification(
//                         fcmToken: widget.resepFcmToken,
//                         channelID: '1',
//                         title: widget.requesterName,
//                         msg: 'ملف',
//                       ).then((value) {
//                         controller.clear();
//                         audioPlayer
//                             .play(AssetSource('images/send_message.mpeg'));
//                       });
//                     });
//                   },
//                   sendAudio: () async {
//                     if (sendAudio.recorder.isRecording) {
//                       await sendAudio.cancel();
//                       Get.defaultDialog(
//                         backgroundColor: Colors.transparent,
//                         title: '',
//                         content: ShowRecord(
//                           isPlaying: isPlaying,
//                           sendAudioChat: () async {
//                             if (!sendAudio.recorder.isRecording) {
//                               await sendAudio
//                                   .stop(
//                                 requesterName: widget.requesterName,
//                                 reciverName: widget.reciverName,
//                                 serviceID: widget.serviceID,
//                                 reciverID: widget.reciverID,
//                                 reciverImage: widget.reciverImage,
//                                 requesterImage: widget.requesterImage,
//                                 resepFcmToken: widget.resepFcmToken,
//                                 timeToFinish: widget.timeReamining,
//                               )
//                                   .then((value) {
//                                 APIs.sendPushNotification(
//                                   fcmToken: widget.resepFcmToken,
//                                   channelID: '1',
//                                   title: widget.requesterName,
//                                   msg: 'ملف صوتي',
//                                 ).then((value) {
//                                   audioPlayer.play(
//                                       AssetSource('images/send_message.mpeg'));
//                                 });
//                                 Get.back();
//                               });
//                             } else {}
//                             setState(() {});
//                           },
//                         ),
//                       );
//                     } else {
//                       HandleError.showToasts(
//                           msg: 'تحدث الان', color: Colors.green);
//                       await sendAudio.record();
//                     }
//                     setState(() {});
//                   },
//                   micColor: sendAudio.recorder.isRecording
//                       ? ColorsApp.primary_color
//                       : Colors.grey.shade300,
//                 )
//         ],
//       ),
//     );
//   }
// }
