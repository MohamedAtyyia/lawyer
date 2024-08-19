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
import '../../../../MODEL/Consulting/delegation_request.dart';
import '../../../Component/component.dart';
import '../../My Consulting/widget/component.dart';
import 'General Consulting/general_consulting.dart';

class RequestDelegation extends StatelessWidget {
  RequestDelegation({super.key});
  ConsultingController consultingController = Get.put(ConsultingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 17.w, right: 17.w),
        child: FutureBuilder<List<DelegationRequestModel?>?>(
          future: consultingController.getDelegationRequest(id: Api.id),
          builder: (context, snapshot) {
            List<DelegationRequestModel?>? item = snapshot.data;
            if (snapshot.hasData) {
              return item!.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          TextApp.smallheightSpace(40),
                          TextApp.customText(
                              text: 'لا توجد طلبات تفويض',
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
                                '${item[index]!.mainConsultingName} - ${item[index]!.subConsultingName}',
                            status: item[index]!.requestStatus ?? '',
                            price: item[index]!.proposedCustomerPay == null
                                ? 'لا يوجد'
                                : '${item[index]!.proposedCustomerPay} ريال ',
                            widget: TextApp.smallheightSpace(50),
                            widget2: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: customButton(
                                    text: 'قبول التفويض',
                                    color: ColorsApp.primary_color,
                                    textColor: Colors.white,
                                    height: 56.h,
                                    onTap: () {
                                      Get.to(() => GeneralConsulting(
                                            consultingID:
                                                item[index]!.consultingId ?? '',
                                            pageNumber: 2,
                                          ));
                                    },
                                  ),
                                ),
                                TextApp.smallwidthSpace(10),
                                Expanded(
                                  child: customButton(
                                    text: 'رفض',
                                    color: const Color(0xffDDB9561A)
                                        .withOpacity(0.2),
                                    textColor: ColorsApp.default_color,
                                    height: 56.h,
                                    onTap: () {},
                                  ),
                                ),
                              ],
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
                        text: 'لا توجد طلبات تفويض',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorsApp.primary_color),
                  ],
                ),
              );
            }
            return HandleError.consultingShimmer;
          },
        ));
  }
}
