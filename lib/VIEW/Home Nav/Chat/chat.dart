import 'package:al_mostashar_lawyer/CONTROLLER/Chat/chat_method.dart';
import 'package:al_mostashar_lawyer/MODEL/Consulting/ended_consulting.dart';
import 'package:al_mostashar_lawyer/chat/view/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../CONTROLLER/App Constant/api.dart';
import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/text.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late List<EndedConsultingModel> allData;
  late List<String> idRooms = [];
  bool isLoading = true;

  final Stream<QuerySnapshot> chat = FirebaseFirestore.instance
      .collection('chat')
      .doc(
          'bd8df9a4-a2f3-4d07-ae43-2b09c80838f5d8626b16-085c-40ff-8de6-35af68114084')
      .collection('message')
      .snapshots();

  @override
  initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    const url = '${Api.baseUrl}${Api.endedConsulting}';
    final dioInstance = dio.Dio();

    dio.FormData data = dio.FormData.fromMap({'id': Api.id});

    final response = await dioInstance.post(url, data: data);
    List body = response.data;
    allData = body.map((e) => EndedConsultingModel.fromJson(e)).toList();
    for (int i = 0; i < allData.length; i++) {
      String id = allData[i].userId ?? i.toString();
      List<String> ids = [id, Api.id];
      ids.sort();
      String idRoom = ids.join();
      idRooms.add(idRoom);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 165.h,
            width: double.infinity,
            padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h),
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              gradient: LinearGradient(
                colors: [
                  ColorsApp.primary_color,
                  ColorsApp.white12,
                  ColorsApp.primary_color,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: TextApp.customText(
                text: 'المحادثات',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white),
          ),
          isLoading
              ? CircularProgressIndicator()
              : allData.isEmpty
                  ? TextApp.customText(
                      text: 'لا توجد محادثات',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)
                  : Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: chat,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Text("لا توجد محادثات");
                          }

                          List<QueryDocumentSnapshot> documents =
                              snapshot.data!.docs;

                          List<ChatModel> allChat =
                              documents.map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return ChatModel.fromJson(data);
                          }).toList();

                          print(allChat[0].lawyer);
                          return ListView.builder(
                              itemBuilder: (context, index) => ListTile());
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
