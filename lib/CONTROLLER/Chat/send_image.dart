import 'dart:io';
import 'package:al_mostashar_lawyer/CONTROLLER/Chat/save_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../App Constant/api.dart';

class SendImage extends GetxController {
  File? _photo;
  XFile? _photo2;
  final ImagePicker _picker = ImagePicker();
  Future imgFromGallery(
      {required String serviceID,
      required String reciverID,
      required String requesterName,
      required String reciverName,
      required String reciverImage,
      required String requesterImage,
      required String resepFcmToken,
      required String timeToFinish}) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile(
          serviceID: serviceID,
          reciverID: reciverID,
          reciverImage: reciverImage,
          requesterImage: requesterImage,
          requesterName: requesterName,
          reciverName: reciverName,
          resepFcmToken: resepFcmToken,
          timeToFinish: timeToFinish);
    } else {}
    update();
  }

  Future uploadFile(
      {required String serviceID,
      required String requesterName,
      required String reciverName,
      required String reciverID,
      required String reciverImage,
      required String requesterImage,
      required String resepFcmToken,
      required String timeToFinish}) async {
    try {
      send(
          serviceID: serviceID,
          reciverID: reciverID,
          requesterName: requesterName,
          reciverName: reciverName,
          reciverImage: reciverImage,
          requesterImage: requesterImage,
          resepFcmToken: resepFcmToken,
          timeToFinish: timeToFinish);
    } catch (e) {}
  }

  Future send(
      {required String serviceID,
      required String reciverID,
      required String requesterName,
      required String reciverName,
      required String resepFcmToken,
      required String reciverImage,
      required String requesterImage,
      required String timeToFinish}) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final fileName = path.basename(_photo!.path);
    final destination = '${Api.id}$fileName';
    final ref = FirebaseStorage.instance.ref(destination);
    final uploadTask = ref.putFile(_photo!);
    final taskSnapshot = await uploadTask;
    final _fileURL = await taskSnapshot.ref.getDownloadURL();
    SaveChat saveChat = Get.put(SaveChat());
    saveChat.sendMessage(
      ConsultingId: serviceID,
      RecieverId: reciverID,
      SenderId: Api.id,
      SenderText: '',
      RequestAudioo: null,
      RequestDocumentt: _photo,
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
      'type': 'image',
      'messageText': _fileURL,
      'isRead': false,
    });
    _firestore.collection('Chat').doc(serviceID).set({
      'senderID': Api.id,
      'reciverID': reciverID,
      'isEnd': true,
      'isDeleteFromRequester': false,
      'isDeleteFromReciver': false
    });
    await ref.putFile(_photo!);
  }
}
