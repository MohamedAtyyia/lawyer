import 'package:al_mostashar_lawyer/VIEW/About/Notifications/widget/custom_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../CONTROLLER/About/About.dart';
import '../../../CONTROLLER/App Constant/api.dart';
import '../../../CONTROLLER/App Constant/colors.dart';
import '../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../CONTROLLER/App Constant/text.dart';
import '../../../MODEL/About/notification_model.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});
  About controller = Get.put(About());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: TextApp.customText(
            text: 'الإشعارات',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: ColorsApp.primary_color),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<NotificationModel?>?>(
        future: controller.getNotification(userID: Api.id),
        builder: (context, snapshot) {
          List<NotificationModel?>? item = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.only(top: 20.h),
                itemCount: item!.length,
                itemBuilder: (context, index) {
                  return customNotificationCard(
                    subject: item[index]!.text!,
                    title: item[index]!.notificationType!,
                    date: DateFormat.yMd()
                        .add_jm()
                        .format(DateTime.parse(item[index]!.createdDate ?? '')),
                  );
                });
          } else if (snapshot.hasError) {
            return HandleError.checkInternetConnection;
          }
          return HandleError.chooseLawyer;
        },
      ),
    );
  }
}
