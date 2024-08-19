import 'dart:developer';

import 'package:al_mostashar_lawyer/VIEW/About/aggent_approval_screen.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/More/all_agent_order/all_agent_orders_screen.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/More/widget/change_image.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/More/widget/custom_profile_card.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/More/widget/delete_account.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../../MODEL/About/my_personal_data.dart';
import '../../../CONTROLLER/App Constant/image.dart';
import '../../About/about_app copy.dart';
import '../../About/approved_office.dart';
import '../../About/change_password.dart';
import '../../About/complaints.dart';
import '../../About/office_approval.dart';
import '../../About/policy copy.dart';
import '../../About/salon_date.dart';
import '../../About/terms_condition copy.dart';
import '../../Auth/login/login_screen.dart';
import '../../Component/component.dart';
import 'widget/custom_section.dart';
import 'widget/my_personal_data.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  Auth auth = Get.put(Auth());
  List<String> sectionList = [
    'مواعيد العمل',
    'طلبات الوكيل',
    'التقييمات',
    'عن التطبيق',
    'الشروط والاحكام',
    'سياسة الخصوصية',
    'الاقتراحات والشكاوي',
    'مشاركة التطبيق',
    'تقييم التطبيق',
    'تغير كلمة المرور',
    'تسجيل الخروج',
    'حذف الحساب'
  ];
  List<dynamic> functionList = [
    () {
      Get.to(() => const SalonDate());
    },
    () {
      Get.to(() => const AllAgentOrdersScreen());
    },
    () {
      Get.to(() => ApprovedOffices());
    },
    () {
      Get.to(() => AboutApp());
    },
    () {
      Get.to(() => TermsAndConditionScreen());
    },
    () {
      Get.to(() => Policy());
    },
    () {
      Get.to(() => Complaint());
    },
    () {
      Get.to(() => null);
    },
    () {
      Get.to(() => null);
    },
    () {
      Get.to(() => const ChangePassword());
    },
    () {
      Get.offAll(() => LoginScreen());
      pref!.remove('id');
      pref!.remove('name');
    },
    () {
      Get.to(() => const DeleteAccountScreen());
    },
  ];

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
          Positioned(
            child: Container(
              height: 200.h,
              width: double.infinity,
              padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
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
                  text: 'المزيد',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: 80.h, bottom: 20.h),
              child: FlipInY(
                child: Column(
                  children: [
                    FutureBuilder<MyPersonalDataModel?>(
                      future: auth.getPersonalData(id: Api.id),
                      builder: (context, snapshot) {
                        MyPersonalDataModel? item = snapshot.data;
                        if (snapshot.hasData) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => MyPersonalData(
                                    fname: item.firstName ?? '',
                                    familyName: item.familyName ?? '',
                                    email: item.email ?? '',
                                    phone: item.userName ?? '',
                                    card: item.identityId ?? '',
                                  ));
                            },
                            child: customProfileCard(
                                userName:
                                    '${item!.firstName ?? ''} ${item.familyName ?? ''}',
                                email: item.email ?? '',
                                image: '${Api.upload}${item.image ?? ''}',
                                verifiedWidget: item.isApprovedOffice == false
                                    ? const SizedBox()
                                    : Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff04C069)),
                                        child: SvgPicture.asset(
                                            ImageApp.verified)),
                                changeImage: () {
                                  Get.to(() => ChangeImageScreen(
                                        image:
                                            '${Api.upload}${item.image ?? ''}',
                                      ));
                                },
                                widget: Column(
                                  children: [
                                    item.isApprovedOffice == true
                                        ? const SizedBox()
                                        : customButton(
                                            text: 'تقديم طلب اعتماد للمكتب',
                                            color: ColorsApp.primary_color,
                                            textColor: Colors.white,
                                            height: 50.h,
                                            onTap: () {
                                              Get.to(
                                                () =>
                                                    const OfficeApprovalRequestScreen(),
                                              );
                                            },
                                          ),
                                    const SizedBox(height: 16),
                                    customButton(
                                      text: 'تقديم طلب وكيل ',
                                      color: ColorsApp.primary_color,
                                      textColor: Colors.white,
                                      height: 50.h,
                                      onTap: () {
                                        Get.to(
                                          () =>
                                              const AgentApprovalRequestScreen(),
                                        );
                                      },
                                    ),
                                  ],
                                )),
                          );
                        } else if (snapshot.hasError) {
                          return HandleError.checkInternetConnection;
                        }
                        return HandleError.profileCardShimmer;
                      },
                    ),
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowIndicator();

                          return true;
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0; i < sectionList.length; i++)
                                customSection(
                                  text: sectionList[i],
                                  color: sectionList[i] == sectionList.last
                                      ? Colors.red
                                      : Colors.white,
                                  textColor: sectionList[i] == sectionList.last
                                      ? Colors.white
                                      : ColorsApp.primary_color,
                                  iconColor: sectionList[i] == sectionList.last
                                      ? Colors.white
                                      : Colors.grey.shade400,
                                  onTap: functionList[i],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
