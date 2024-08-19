import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/colors.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/text.dart';
import 'package:al_mostashar_lawyer/chat/data.dart';
import 'package:al_mostashar_lawyer/chat/view/widget/item_chat.dart';
import 'package:al_mostashar_lawyer/chat/view/widget/item_chat2.dart';
import 'package:al_mostashar_lawyer/chat/view/widget/open_pdf.dart';
import 'package:al_mostashar_lawyer/chat/view/widget/send_message.dart';
import 'package:al_mostashar_lawyer/chat/view/widget/void_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatScreen2 extends StatefulWidget {
  const ChatScreen2({
    super.key,
    required this.id,
    required this.name,
    required this.isSendMessage,
    required this.id2,
    required this.idRoom,
  });
  final String id;
  final String id2;
  final String name;
  final String idRoom;
  final bool isSendMessage;

  @override
  State<ChatScreen2> createState() => _ChatScreen2State();
}

class _ChatScreen2State extends State<ChatScreen2> {
  late final Stream<QuerySnapshot> chat;
  late ScrollController controller;
  GetData methods = Get.put(GetData());

  @override
  void initState() {
    super.initState();
    controller = ScrollController();

    methods.initRecording();
    chat = FirebaseFirestore.instance
        .collection('chat')
        .doc(widget.idRoom)
        .collection('message')
        .orderBy('date')
        .snapshots();
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        controller.animateTo(
          controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (t) {
        fileState = FileState.init;
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 23,
              )),
          // automaticallyImplyLeading: false,
          backgroundColor: ColorsApp.primary_color,
          centerTitle: true,
          title: TextApp.customText(
            text: widget.name,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
            maxLine: 1,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: chat,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  List<dynamic> data = snapshot.data!.docs;
                  List<ChatModel> allChat = [];

                  for (int i = 0; i < data.length; i++) {
                    allChat.add(
                      ChatModel.fromJson(
                          data[i].data() as Map<String, dynamic>),
                    );
                  }

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    scrollToBottom();
                  });

                  return ListView.builder(
                    controller: controller,
                    itemCount: allChat.length,
                    itemBuilder: (context, index) {
                      if (allChat[index].audio != null) {
                        return VoidMessage1(
                          url: allChat[index].audio!,
                          isMyaudio: allChat[index].id == Api.id ? true : false,
                        );
                      } else if (allChat[index].file != null) {
                        return OpenPdf(
                            message: allChat[index].message,
                            url: allChat[index].file!,
                            mainAxisAlignment: allChat[index].id == Api.id
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start);
                      } else if (allChat[index].id == Api.id) {
                        return ItemChat1(chatModel: allChat[index]);
                      } else {
                        return ItemChat2(chatModel: allChat[index]);
                      }
                    },
                  );
                },
              ),
            ),
            SendMessage(
              idRoom: widget.idRoom,
              id: widget.id,
              id2: widget.id2,
              controller: controller,
              user: widget.name,
              isSendMessagel: widget.isSendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatModel {
  final String message;
  final String id;
  final String? urlImage;
  final DateTime data;
  final String lawyer;
  final String user;
  final String? audio;
  final String? file;

  ChatModel({
    required this.message,
    this.audio,
    required this.user,
    required this.id,
    required this.lawyer,
    this.urlImage,
    this.file,
    required this.data,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        lawyer: json['lawyer'],
        user: json['user'],
        message: json['message'],
        id: json['id'],
        file: json['file'],
        urlImage: json['image'] ?? null,
        audio: json['audio'] ?? null,
        data: (json['date'] as Timestamp).toDate(),
      );
}
