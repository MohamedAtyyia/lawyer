import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../App Constant/api.dart';

class SendMessages extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  sendMessage({
    required String senderName,
    required String reciverName,
    required String messageText,
    required String serviceID,
    required String timeToFinish,
    required String reciverID,
    required String reciverImage,
    required String requesterImage,
    required String resepFcmToken,
  }) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    _firestore.collection('Chat').doc(serviceID).collection('messages').add({
      'senderID': Api.id,
      'senderName': senderName,
      'reciverName': reciverName,
      'serviceID': serviceID,
      'reciverID': reciverID,
      'reciverImage': reciverImage,
      'requesterImage': requesterImage,
      'time': DateTime.now(),
      'timeToFinish': timeToFinish,
      'type': 'text',
      'messageText': messageText,
      'fcmToken': fcmToken,
      'resepFcmToken': resepFcmToken,
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
