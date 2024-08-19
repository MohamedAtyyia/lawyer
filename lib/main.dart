import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/VIEW/splash/splash_screen.dart';
import 'package:al_mostashar_lawyer/firebase_notification.dart';
import 'package:al_mostashar_lawyer/firebase_options.dart';
import 'package:al_mostashar_lawyer/local_notification.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CONTROLLER/App Constant/colors.dart';

SharedPreferences? pref;
var myFcmToken;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String? a = await pref!.getString('id');
  Api.id = a ?? "null";

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'chat',
        channelName: 'chat app',
        channelDescription: 'chat app noti',
        defaultColor: Colors.red,
        ledColor: Colors.blue,
        importance: NotificationImportance.Max,
        locked: false,
        channelShowBadge: true,
        defaultRingtoneType: DefaultRingtoneType.Notification,
      ),
      NotificationChannel(
        channelKey: '3',
        channelName: 'chat app',
        channelDescription: 'chat app noti',
        defaultColor: Colors.red,
        ledColor: Colors.blue,
        importance: NotificationImportance.Max,
        locked: false,
        channelShowBadge: true,
        defaultRingtoneType: DefaultRingtoneType.Notification,
      ),
      NotificationChannel(
          channelKey: 'schedule',
          channelName: 'chat app',
          channelDescription: 'chat app noti',
          defaultColor: Colors.red,
          ledColor: Colors.blue,
          importance: NotificationImportance.Max,
          locked: false,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: '2',
        channelGroupName: 'offer',
      ),
      NotificationChannelGroup(
        channelGroupKey: '3',
        channelGroupName: 'offers',
      ),
    ],
  );

  FirebaseNotification.init();
  LocalNotifications.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: ColorsApp.primary_color));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final id = pref!.getString('id');
  @override
  Widget build(BuildContext context) {
    print(Api.id);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'المستشار',
          locale: const Locale('ar'),
          theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: ColorsApp.primary_color,
            ),
            textSelectionTheme: const TextSelectionThemeData(
                selectionHandleColor: ColorsApp.primary_color),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
