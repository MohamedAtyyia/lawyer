import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../App Constant/api.dart';

class ChatMethod extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessageRoom() {
    final Query messagesQuery = _firestore
        .collection('Chat')
        .where(Filter.or(Filter('senderID', isEqualTo: Api.id),
            Filter('reciverID', isEqualTo: Api.id)))
        .where('isDeleteFromReciver', isEqualTo: false);
    Stream<QuerySnapshot> messagesStream = messagesQuery.snapshots();
    return messagesStream;
  }

  Stream<QuerySnapshot> getMessages({required String docID}) {
    final Query messagesQuery = _firestore
        .collection('Chat')
        .doc(docID)
        .collection('messages')
        .where(Filter.or(Filter('senderID', isEqualTo: Api.id),
            Filter('reciverID', isEqualTo: Api.id)));
    Stream<QuerySnapshot> messagesStream = messagesQuery.snapshots();
    return messagesStream;
  }

  Future<DocumentSnapshot> getLastMessage({required String docID}) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Chat')
        .doc(docID)
        .collection('messages')
        .orderBy('time', descending: true)
        .limit(1)
        .get();
    return querySnapshot.docs.first;
  }

  Future deleteChatRoom({required String serviceID}) async {
    final chatRoomRef =
        FirebaseFirestore.instance.collection("Chat").doc(serviceID);
    final chatRoomSnapshot = await chatRoomRef.get();
    final chatEnded = chatRoomSnapshot.data()!['isDeleteFromRequester'];
    return chatRoomRef.update(({'isDeleteFromReciver': true}));
  }
}
