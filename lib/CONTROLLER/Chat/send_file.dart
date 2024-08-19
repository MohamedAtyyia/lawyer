import 'dart:io';
import 'package:al_mostashar_lawyer/CONTROLLER/Chat/save_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../App Constant/api.dart';
import '../App Constant/colors.dart';
import '../App Constant/handle_error.dart';

class SendFile extends GetxController {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future sendFile() async {
    final result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
    if (result == null) return;
    pickedFile = result.files.first;

    update();
  }

  Future uploadFile(
      {required String serviceID,
      required String reciverID,
      required String requesterName,
      required String reciverName,
      required String reciverImage,
      required String requesterImage,
      required String resepFcmToken,
      required String timeToFinish}) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {
      return HandleError.showToasts(
          msg: 'تم ارسال الملف', color: ColorsApp.primary_color);
    });
    final urlDownload = await snapshot.ref.getDownloadURL();
    SaveChat saveChat = Get.put(SaveChat());
    saveChat.sendMessage(
      ConsultingId: serviceID,
      RecieverId: reciverID,
      SenderId: Api.id,
      SenderText: '',
      RequestAudioo: null,
      RequestDocumentt: file,
    );
    final _firestore = FirebaseFirestore.instance;
    _firestore.collection('Chat').doc(serviceID).collection('messages').add({
      'senderID': Api.id,
      'fcmToken': fcmToken,
      'resepFcmToken': resepFcmToken,
      'senderName': requesterName,
      'reciverName': reciverName,
      'reciverImage': reciverImage,
      'requesterImage': requesterImage,
      'serviceID': serviceID,
      'reciverID': reciverID,
      'time': DateTime.now(),
      'timeToFinish': timeToFinish,
      'type': 'file',
      'messageText': urlDownload,
      'isRead': false,
    });
    _firestore.collection('Chat').doc(serviceID).set({
      'senderID': Api.id,
      'reciverID': reciverID,
      'isEnd': true,
      'isDeleteFromRequester': false,
      'isDeleteFromReciver': false
    });
  }
}
