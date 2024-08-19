import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/MODEL/Consulting/canceled_consulting.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../CONTROLLER/App Constant/api.dart';
import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';
import '../../../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../Home Page/screen/General Consulting/general_consulting.dart';
import 'component.dart';

class Canceled extends StatelessWidget {
  Canceled({super.key});
  ConsultingController consultingController = Get.put(ConsultingController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 10.h, left: 17.w, right: 17.w, bottom: 17.h),
      child: FutureBuilder<List<CanceledConsultingModel?>?>(
          future: consultingController.getCanceledConsulting(id: Api.id),
          builder: (context, snapshot) {
            List<CanceledConsultingModel?>? item = snapshot.data;
            if (snapshot.hasData) {
              return item!.isEmpty
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: TextApp.customText(
                            text: 'لا توجد استشارات ملغية',
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
                              child: customConsultingCard(
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
                                sizedHeight: 85.h,
                                widget: Column(
                                  children: [
                                    TextApp.smallheightSpace(22),
                                    TextApp.customText(
                                        text: 'تم الإلغاء من قبل العميل',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: ColorsApp.default_color),
                                  ],
                                ),
                                widget2: const SizedBox(),
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
                        text: 'لا توجد استشارات ملغية',
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
