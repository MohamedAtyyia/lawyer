import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Home Nav/Wallet/my_wallet.dart';
import '../../../../MODEL/Wallet/my_wallet.dart';
import 'widget/custom_payment_card.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  MyWalletController controller = Get.put(MyWalletController());

  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 260.h,
            width: double.infinity,
            padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                colors: [
                  ColorsApp.primary_color,
                  ColorsApp.white12,
                  ColorsApp.primary_color,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: TextApp.customText(
                text: 'محفظتي',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white),
          ),
          Positioned(
            child: FutureBuilder<MyWalletModel?>(
                future: controller.getData(id: Api.id),
                builder: (context, snapshot) {
                  MyWalletModel? item = snapshot.data;
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.only(top: 110.h, bottom: 20.h),
                      child: FlipInY(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                              height: 180.h,
                              width: double.infinity,
                              margin: EdgeInsets.only(right: 17.w, left: 17.w),
                              padding: EdgeInsets.only(
                                  top: 22.h,
                                  bottom: 22.h,
                                  left: 15.w,
                                  right: 15.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 3,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  TextApp.customText(
                                      text: 'أرباحك من التطبيق',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.grey.shade400),
                                  TextApp.smallheightSpace(22),
                                  TextApp.customText(
                                      text:
                                          '${item!.netChargeValue} ريال سعودي',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                      color: ColorsApp.primary_color),
                                  TextApp.smallheightSpace(23),
                                  TextApp.customText(
                                      text:
                                          'نسبة التطبيق في الأرباح ${item.appProfit ?? '0'} ريال سعودي',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: ColorsApp.default_color),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 400.h,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      item.lstTransactionElements!.length,
                                  itemBuilder: (context, index) {
                                    var transactionElement =
                                        item.lstTransactionElements![index];

                                    // التعامل مع التواريخ هنا
                                    String transactionDate = 'تاريخ غير صالح';
                                    String consultingDate = 'تاريخ غير صالح';

                                    if (transactionElement
                                                .consultingDateAndTime !=
                                            null &&
                                        transactionElement
                                            .consultingDateAndTime!
                                            .isNotEmpty) {
                                      try {
                                        transactionDate = DateFormat.yMd()
                                            .format(DateTime.parse(
                                                transactionElement
                                                    .consultingDateAndTime!));
                                      } catch (e) {
                                        print(
                                            'خطأ في تحليل تاريخ consultingDateAndTime: $e');
                                      }
                                    }

                                    if (transactionElement.createdDate !=
                                            null &&
                                        transactionElement
                                            .createdDate!.isNotEmpty) {
                                      try {
                                        consultingDate = DateFormat.yMd()
                                            .format(DateTime.parse(
                                                transactionElement
                                                    .createdDate!));
                                      } catch (e) {
                                        print(
                                            'خطأ في تحليل تاريخ createdDate: $e');
                                      }
                                    }

                                    return customPaymentCard(
                                      transactionDate: transactionDate,
                                      transactionType:
                                          transactionElement.chargeTypeSender ??
                                              '',
                                      transPayment:
                                          transactionElement.chargeValue ?? '',
                                      consultingNum:
                                          transactionElement.requestNo ?? '',
                                      consultingDate: consultingDate,
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return HandleError.checkInternetConnection;
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      HandleError.walletShimmer,
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
