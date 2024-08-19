import 'package:al_mostashar_lawyer/local_notification.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseNotification {
  static Future<void> init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    myFcmToken = await messaging.getToken();
    messaging.subscribeToTopic('LawyerNotification');
    FirebaseMessaging.onMessage.listen(onMessage);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    print('Device Token is $myFcmToken');
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print(message.notification!.body);
  }

  static Future<void> onMessage(RemoteMessage message) async {
    print('ahmed ');
    print(message.notification!.title);
    print(message.notification!.body);
    LocalNotifications.sendNotification(
        title: message.notification!.title!, body: message.notification!.body!);
  }
}
