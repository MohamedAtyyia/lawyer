import 'dart:developer';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/MODEL/Consulting/current_consulting.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/Home%20Page/screen/private_consulting.dart';
import 'package:al_mostashar_lawyer/chat/view/chat_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';
import '../../../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../Component/component.dart';
import '../../Home Page/screen/General Consulting/general_consulting.dart';
import 'component.dart';

class Current extends StatefulWidget {
  const Current({super.key});

  @override
  State<Current> createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  ConsultingController consultingController = Get.put(ConsultingController());

  Auth auth = Get.put(Auth());

  // DateTime? startDate;

  // Future<DateTime> realTime() async {
  //   startDate = await NTP.now();
  //   return startDate!;
  // }

  @override
  void initState() {
    // realTime();
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 10.h, left: 17.w, right: 17.w, bottom: 17.h),
      child: FutureBuilder<List<CurrentConsulting?>?>(
        future: consultingController.getCurrentConsulting(id: Api.id),
        builder: (context, snapshot) {
          List<CurrentConsulting?>? item = snapshot.data;
          if (snapshot.hasData) {
            return item!.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: TextApp.customText(
                          text: 'لا توجد استشارات حالية',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.white),
                    ),
                  )
                : FlipInY(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => GeneralConsulting(
                                  pageNumber: 1,
                                  consultingID: item[index]!.consultingId ?? '',
                                  consultingPrice: null,
                                ));
                          },
                          child:

                              // CardPrivat(data: item[index]!)
                              customConsultingCard(
                            text:
                                '${item[index]!.userFirstName ?? ''} ${item[index]!.userFamilyName ?? ''}',
                            sizedHeight: 120.h,
                            image:
                                '${Api.upload}${item[index]!.userImage ?? ''}',
                            consultingDate: DateFormat.yMd().add_jm().format(
                                DateTime.parse(item[index]!.createdDate ?? '')),
                            consultingNo: item[index]!.requestNo ?? '',
                            consultingName:
                                '${item[index]!.mainConsultingName ?? ''} - ${item[index]!.subConsultingName ?? item[index]!.unDefinedSubConsultingName}',
                            status: item[index]!.requestStatus ?? '',
                            price: item[index]!.createdBy == null
                                ? 'لا يوجد'
                                : '${item[index]!.createdBy} ريال ',
                            widget: SizedBox(),

                            //  Column(
                            //   children: [
                            //     TextApp.smallheightSpace(22),
                            //     Row(
                            //       children: [
                            //         TextApp.customText(
                            //             text: 'ستبدأ الاستشارة بعد',
                            //             fontWeight: FontWeight.w500,
                            //             fontSize: 12,
                            //             color: Colors.grey.shade400),
                            //         TextApp.smallwidthSpace(5),
                            //         SizedBox(
                            //           width: 130.w,
                            //           child: CountdownTimer(
                            //             endTime: DateTime.parse(item[index]!
                            //                         .propsedTimeFinishConsultFormatted ??
                            //                     '')
                            //                 .millisecondsSinceEpoch,
                            //             endWidget: TextApp.customText(
                            //                 text: 'بدأت الإستشارة',
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: 14,
                            //                 color: ColorsApp.default_color),
                            //             textStyle: TextStyle(
                            //                 fontFamily: 'tajwal',
                            //                 fontSize: 12.sp,
                            //                 color: ColorsApp.default_color,
                            //                 fontWeight: FontWeight.w700),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     TextApp.smallheightSpace(28),
                            //   ],
                            // ),

                            widget2: customButton(
                              text: 'تحدث مع العميل',
                              color: ColorsApp.primary_color,
                              textColor: Colors.white,
                              height: 56.h,
                              onTap: () {
                                final DateFormat format =
                                    DateFormat('yyyy-M-d HH:mm');

                                // تحويل consultingDateAndTime إلى كائن DateTime باستخدام التنسيق المخصص
                                DateTime consultingDateTime = format
                                    .parse(item[index]!.consultingDateAndTime!);

                                // الحصول على الوقت الحالي
                                DateTime now = DateTime.now();

                                // تنسيق consultingDateTime
                                String consultingDate = DateFormat('yyyy-MM-dd')
                                    .format(consultingDateTime);
                                String consultingTime = DateFormat('HH:mm')
                                    .format(consultingDateTime);

                                // مقارنة الوقت الحالي بالوقت المطلوب
                                if (consultingDateTime.isBefore(now)) {
                                  navigator(context, item, index);
                                } else if (consultingDateTime
                                    .isAtSameMomentAs(now)) {
                                  navigator(context, item, index);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('موعد الاستشارة لم ياتى بعد'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('موعد الاستشارة سوف يبدأ...'),
                                          Text('اليوم: $consultingDate'),
                                          Text('الوقت: $consultingTime'),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('موافق'),
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                // if (DateTime.parse(item[index]!
                                //             .propsedTimeFinishConsultFormatted ??
                                //         '')
                                //     .isAfter(startDate!)) {
                                //   HandleError.showToasts(
                                //       msg: 'لم تبدأ الإستشارة بعد',
                                //       color: Colors.red);
                                // } else {
                                //   auth
                                //       .getPersonalData(id: item[index]!.userId!)
                                //       .then((value) {
                                //     Get.to(
                                //       () => ChatScreen(
                                //         pageNumber: 0,
                                //         requesterImage:
                                //             '${Api.upload}${value!.image ?? ''}',
                                //         reciverImage:
                                //             '${Api.upload}${item[index]!.userImage ?? ''}',
                                //         serviceID:
                                //             item[index]!.consultingId ?? '',
                                //         reciverID: item[index]!.userId ?? '',
                                //         timeReamining: DateTime.parse(item[
                                //                         index]!
                                //                     .propsedTimeFinishConsult ??
                                //                 DateTime.now().toString())
                                //             .millisecondsSinceEpoch
                                //             .toString(),
                                //         requesterName:
                                //             '${item[index]!.userFirstName ?? ''} ${item[index]!.userFamilyName ?? ''}',
                                //         reciverName:
                                //             item[index]!.lawyerName ?? '',
                                //         resepFcmToken: value.deviceToken ?? '',
                                //       ),
                                //     );
                                //   });
                                // }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
          } else if (snapshot.hasError) {
            return HandleError.checkInternetConnection;
          }
          return HandleError.consultingShimmer;
        },
      ),
    );
  }

  void navigator(
      BuildContext context, List<CurrentConsulting?> item, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatScreen2(
          id: item[index]!.lawyerId!,
          idRoom: item[index]!.consultingId!,
          id2: item[index]!.userId!,
          name: item[index]!.userFirstName!,
          isSendMessage: true,
        ),
      ),
    );
  }
}
