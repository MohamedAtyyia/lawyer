import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../../../MODEL/Consulting/general_consulting.dart';
import '../../../Component/component.dart';
import '../../My Consulting/widget/component.dart';
import 'General Consulting/general_consulting.dart';

class PublicConsulting extends StatelessWidget {
  PublicConsulting({super.key});
  ConsultingController consultingController = Get.put(ConsultingController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 17.w, right: 17.w),
      child: FutureBuilder<List<GeneralConsultingModel?>?>(
          future: consultingController.getGeneralConsulting(id: Api.id),
          builder: (context, snapshot) {
            List<GeneralConsultingModel?>? item = snapshot.data;
            if (snapshot.hasData) {
              return item!.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          TextApp.smallheightSpace(40),
                          TextApp.customText(
                              text: 'لا توجد استشارات عامة',
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
                            sizedHeight: 80.h,
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
                            widget: TextApp.smallheightSpace(5),
                            widget2: customButton(
                              text: 'تفاصيل الإستشارة',
                              color: ColorsApp.primary_color,
                              textColor: Colors.white,
                              height: 56.h,
                              onTap: () {
                                Get.to(() => GeneralConsulting(
                                      consultingID:
                                          item[index]!.consultingId ?? '',
                                      pageNumber: 0,
                                      consultingPrice:
                                          item[index]!.proposedCustomerPay,
                                    ));
                              },
                            ),
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
                        text: 'لا توجد استشارات عامة',
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
