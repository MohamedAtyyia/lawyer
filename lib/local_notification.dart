import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static ontap(NotificationResponse details) {}

  static Future<void> init() async {
    InitializationSettings nitializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        // onDidReceiveLocalNotification:
        //     (int id, String? title, String? body, String? payload) async {},
      ),
    );
    flutterLocalNotificationsPlugin.initialize(
      nitializationSettings,
      onDidReceiveBackgroundNotificationResponse: ontap,
      onDidReceiveNotificationResponse: ontap,
    );
  }

  static Future<void> sendNotification(
      {required String title, required String body}) async {
    flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        NotificationDetails(
            android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          importance: Importance.max,
          priority: Priority.high,
        )));
  }
}
