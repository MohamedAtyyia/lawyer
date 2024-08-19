import 'package:al_mostashar_lawyer/chat/view/chat_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../../../MODEL/Consulting/private_consulting.dart';
import '../../My Consulting/widget/component.dart';

class PrivateConsulting extends StatelessWidget {
  PrivateConsulting({super.key});
  ConsultingController consultingController = Get.put(ConsultingController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 17.w, right: 17.w),
      child: FutureBuilder<List<PrivateConsultingModel?>?>(
          future: consultingController.getPrivateConsulting(id: Api.id),
          builder: (context, snapshot) {
            List<PrivateConsultingModel?>? item = snapshot.data;
            if (snapshot.hasData) {
              return item!.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          TextApp.smallheightSpace(40),
                          TextApp.customText(
                              text: 'لا توجد استشارات خاصة',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: ColorsApp.primary_color),
                        ],
                      ),
                    )
                  : FlipInY(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return customConsultingCard(
                            text:
                                '${item[index]!.userFirstName ?? ''} ${item[index]!.userFamilyName ?? ''}',
                            sizedHeight: 120.h,
                            image: '${Api.upload}${item[index]!.userImage}',
                            consultingDate: DateFormat.yMd().add_jm().format(
                                DateTime.parse(item[index]!.createdDate!)),
                            consultingNo: item[index]!.requestNo ?? '',
                            consultingName:
                                '${item[index]!.mainConsultingName} - ${item[index]!.subConsultingName ?? item[index]!.unDefinedSubConsultingName}',
                            status: item[index]!.requestStatus ?? '',
                            price: item[index]!.proposedCustomerPay == null
                                ? 'لا يوجد'
                                : '${item[index]!.proposedCustomerPay} ريال ',
                            widget: Column(
                              children: [
                                TextApp.smallheightSpace(22),
                                Row(
                                  children: [
                                    TextApp.customText(
                                        text: 'ستبدأ الاستشاره بعد',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey.shade400),
                                    TextApp.smallwidthSpace(5),
                                    SizedBox(
                                      width: 130.w,
                                      child: CountdownTimer(
                                        endTime: DateTime.parse(item[index]!
                                                    .consultingDateAndTime ??
                                                '')
                                            .millisecondsSinceEpoch,
                                        endWidget: TextApp.customText(
                                            text: 'بدأت الإستشارة',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: ColorsApp.default_color),
                                        textStyle: TextStyle(
                                            fontFamily: 'tajwal',
                                            fontSize: 12.sp,
                                            color: ColorsApp.default_color,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                                TextApp.smallheightSpace(15),
                              ],
                            ),
                            widget2: TextApp.smallheightSpace(5),
                          );
                        },
                      ),
                    );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    TextApp.smallheightSpace(40),
                    TextApp.customText(
                        text: 'لا توجد استشارات خاصة',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorsApp.primary_color),
                  ],
                ),
              );
            }
            return HandleError.consultingShimmer;
          }),
    );
  }
}

// class CardPrivat extends StatelessWidget {
//   const CardPrivat({super.key, required this.data});
//   final PrivateConsultingModel data;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       alignment: Alignment.center,
//       margin: EdgeInsets.only(bottom: 24.h, top: 5.h),
//       padding:
//           EdgeInsets.only(top: 16.h, left: 10.w, right: 10.w, bottom: 16.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 3,
//             spreadRadius: 3,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextApp.customText(
//                   text: data.createdDate!,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12,
//                   color: Colors.grey.shade400),
//               TextApp.customText(
//                   text: data.requestNo!,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12,
//                   color: Colors.grey.shade400),
//             ],
//           ),
//           TextApp.smallheightSpace(13),
//           TextApp.customText(
//               text: '${data.userFirstName!} ${data.userFamilyName}',
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: ColorsApp.primary_color),
//           TextApp.smallheightSpace(12),
//           TextApp.customText(
//               text:
//                   '${data.mainConsultingName} : ${data.unDefinedSubConsultingName}',
//               fontWeight: FontWeight.w500,
//               fontSize: 12,
//               color: Colors.grey.shade400),
//           TextApp.smallheightSpace(12),
//           TextApp.customText(
//               text: 'الحالة : ${data.requestStatus}',
//               fontWeight: FontWeight.w500,
//               fontSize: 12,
//               color: Colors.grey.shade400),
//           TextApp.smallheightSpace(12),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => ChatScreen2(
//                     id: data.lawyerId!,
//                     name: 'data.la!',
//                     isSendMessage: false,
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               width: MediaQuery.sizeOf(context).width * 1,
//               alignment: Alignment.center,
//               padding: EdgeInsets.symmetric(vertical: 18),
//               margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                   color: ColorsApp.primary_color,
//                   borderRadius: BorderRadius.circular(8)),
//               child: TextApp.customText(
//                   text: 'المحادثة',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12,
//                   color: Colors.grey.shade400),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
