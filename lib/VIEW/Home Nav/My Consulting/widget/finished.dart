import 'package:al_mostashar_lawyer/MODEL/Consulting/ended_consulting.dart';
import 'package:al_mostashar_lawyer/chat/view/chat_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../CONTROLLER/App Constant/api.dart';
import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';
import '../../../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../Home Page/screen/General Consulting/general_consulting.dart';
import 'component.dart';

class Finished extends StatelessWidget {
  Finished({super.key});
  ConsultingController consultingController = Get.put(ConsultingController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 10.h, left: 17.w, right: 17.w, bottom: 17.h),
      child: Column(
        children: [
          FutureBuilder<List<EndedConsultingModel?>?>(
              future: consultingController.getEndedConsulting(id: Api.id),
              builder: (context, snapshot) {
                List<EndedConsultingModel?>? item = snapshot.data;
                if (snapshot.hasData) {
                  return item!.isEmpty
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: TextApp.customText(
                                text: 'لا توجد استشارات منتهية',
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
                                          consultingID:
                                              item[index]!.consultingId ?? '',
                                          consultingPrice: null,
                                        ));
                                  },
                                  child: customConsultingCard2(
                                    height: 210.h,
                                    sizedHeight: 150.h,
                                    text:
                                        '${item[index]!.userFirstName ?? ''} ${item[index]!.userFamilyName ?? ''}',
                                    image:
                                        '${Api.upload}${item[index]!.userImage ?? ''}',
                                    consultingDate: DateFormat.yMd()
                                        .add_jm()
                                        .format(DateTime.parse(
                                            item[index]!.createdDate ?? '')),
                                    consultingNo: item[index]!.requestNo ?? '',
                                    consultingName:
                                        '${item[index]!.mainConsultingName ?? ''} - ${item[index]!.subConsultingName ?? item[index]!.unDefinedSubConsultingName}',
                                    status: item[index]!.requestStatus ?? '',
                                    price: item[index]!.createdBy == null
                                        ? 'لا يوجد'
                                        : '${item[index]!.createdBy} ريال ',
                                    widget: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextApp.smallheightSpace(22),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // TextApp.customText(
                                            //     text: 'انتهت الاستشاره',
                                            //     fontWeight: FontWeight.bold,
                                            //     fontSize: 16,
                                            //     color: ColorsApp.default_color),

                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatScreen2(
                                                      id: item[index]!
                                                          .userFirstName!,
                                                      idRoom: item[index]!
                                                          .consultingId!,
                                                      id2: item[index]!.userId!,
                                                      name: item[index]!
                                                          .userFirstName!,
                                                      isSendMessage: false,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                        ColorsApp.primary_color,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 8),
                                                child: TextApp.customText(
                                                    text: 'الذهاب الى المحادثة',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                    color: ColorsApp
                                                        .default_color),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        TextApp.smallheightSpace(40),
                        TextApp.customText(
                            text: 'لا توجد استشارات منتهية',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: ColorsApp.primary_color),
                      ],
                    ),
                  );
                }
                return HandleError.consultingShimmer;
              }),
        ],
      ),
    );
  }
}
