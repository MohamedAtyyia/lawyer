import 'dart:io';
import 'package:al_mostashar_lawyer/CONTROLLER/Chat/save_chat.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../App Constant/api.dart';
import '../App Constant/colors.dart';
import '../App Constant/handle_error.dart';

class SendAudio extends GetxController {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  final audioPlayer = AudioPlayer();

  bool isPlaying = false;
  File? audioFile;
  UploadTask? uploadTask;
  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future cancel() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    audioFile = File(path!);
  }

  Future stop(
      {required String requesterName,
      required String reciverName,
      required String reciverID,
      required String serviceID,
      required String reciverImage,
      required String requesterImage,
      required String resepFcmToken,
      required String timeToFinish}) async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final per = audioFile;
    audioFile = File(path!);

    uploadFile(
        requesterName: requesterName,
        reciverName: reciverName,
        serviceID: serviceID,
        reciverID: reciverID,
        reciverImage: reciverImage,
        requesterImage: requesterImage,
        resepFcmToken: resepFcmToken,
        timeToFinish: timeToFinish);
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
    final path = 'files/${audioFile!.path}';
    final file = File(audioFile!.path);
    final ref = FirebaseStorage.instance.ref().child(path);

    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {
      return HandleError.showToasts(
          msg: 'تم ارسال الصوت', color: ColorsApp.primary_color);
    });
    final urlDownload = await snapshot.ref.getDownloadURL();
    SaveChat saveChat = Get.put(SaveChat());
    saveChat.sendMessage(
      ConsultingId: serviceID,
      RecieverId: reciverID,
      SenderId: Api.id,
      SenderText: '',
      RequestAudioo: file,
      RequestDocumentt: file,
    );
    final _firestore = FirebaseFirestore.instance;
    _firestore.collection('Chat').doc(serviceID).collection('messages').add({
      'senderID': Api.id,
      'reciverID': reciverID,
      'fcmToken': fcmToken,
      'resepFcmToken': resepFcmToken,
      'senderName': requesterName,
      'reciverName': reciverName,
      'reciverImage': reciverImage,
      'requesterImage': requesterImage,
      'serviceID': serviceID,
      'time': DateTime.now(),
      'timeToFinish': timeToFinish,
      'type': 'audio',
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

  Future initRecording() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'لا يعمل الميكرفون';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }
}
