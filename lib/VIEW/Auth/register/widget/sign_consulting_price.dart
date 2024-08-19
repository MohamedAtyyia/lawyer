import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../CONTROLLER/App Constant/api.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../../CONTROLLER/Auth/Auth.dart';
import '../../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../../../MODEL/Consulting/main_consulting.dart';
import '../../../Component/component.dart';

class SignConsultingPrice extends StatefulWidget {
  SignConsultingPrice({super.key, required this.pageController});
  PageController pageController = PageController();

  @override
  State<SignConsultingPrice> createState() => _SignConsultingPriceState();
}

class _SignConsultingPriceState extends State<SignConsultingPrice> {
  ConsultingController consultingController = Get.put(ConsultingController());
  Auth consultingPrice = Get.put(Auth());
  TextEditingController firstPriceController = TextEditingController();
  TextEditingController secondPriceController = TextEditingController();
  TextEditingController thirdPriceController = TextEditingController();
  late bool isLoading = false;

  List<bool> isChecked = [];
  List<Map<String, dynamic>> majorList = [];

  @override
  Widget build(BuildContext context) {
    void addItemToList(Map<String, dynamic> newItem) {
      if (!majorList.any(
          (item) => item['MainConsultingId'] == newItem['MainConsultingId'])) {
        majorList.add(newItem);
      }
    }

    void removeItemFromList(Map<String, dynamic> newItem) {
      majorList.remove(newItem);
    }

    void updateFirstConsulting(String newPrice) {
      majorList.forEach((item) {
        item['Consulting30MinutesCost'] = newPrice;
      });
      setState(() {});
    }

    void updateSecondConsulting(String newPrice) {
      majorList.forEach((item) {
        item['Consulting60MinutesCost'] = newPrice;
      });
      setState(() {});
    }

    void updateThirdConsulting(String newPrice) {
      majorList.forEach((item) {
        item['Consulting90MinutesCost'] = newPrice;
      });
      setState(() {});
    }

    return Stack(
      children: [
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView(
            children: [
              TextApp.customText(
                  text: 'حدد تخصصاتك',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: ColorsApp.primary_color),
              TextApp.smallheightSpace(20),
              Container(
                constraints: BoxConstraints(maxHeight: 200.h, minHeight: 100.h),
                height: 100.h,
                child: FutureBuilder<List<MainConsultingModel?>?>(
                    future: consultingController.getConsulting(id: Api.id),
                    builder: (context, snapshot) {
                      List<MainConsultingModel?>? item = snapshot.data;
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 50),
                            itemCount: item!.length,
                            itemBuilder: (context, index) {
                              isChecked.add(false);
                              return CheckboxListTile(
                                activeColor: ColorsApp.primary_color,
                                checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80)),
                                title: TextApp.customText(
                                    text:
                                        item[index]!.mainConsultingTitle ?? '',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: ColorsApp.primary_color),
                                value: isChecked[index],
                                onChanged: (bool? value) {
                                  isChecked[index] = !isChecked[index];
                                  if (isChecked[index] == true) {
                                    setState(() {
                                      addItemToList({
                                        "MainConsultingId":
                                            item[index]!.mainConsultingId,
                                        "Consulting30MinutesCost":
                                            firstPriceController.text,
                                        "Consulting60MinutesCost":
                                            secondPriceController.text,
                                        "Consulting90MinutesCost":
                                            thirdPriceController.text
                                      });
                                    });
                                  } else {
                                    setState(() {
                                      majorList.clear();
                                    });
                                  }
                                },
                              );
                            });
                      } else if (snapshot.hasError) {
                        return HandleError.checkInternetConnection;
                      }
                      return HandleError.mainKindShimmer;
                    }),
              ),
              Visibility(
                visible: majorList.isEmpty ? false : true,
                child: TextApp.customText(
                    text: 'يوجد 3 انواع من الإستشارات يرجى تحديد أسعارها',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: ColorsApp.primary_color),
              ),
              Visibility(
                  visible: majorList.isEmpty ? false : true,
                  child: TextApp.smallheightSpace(20)),
              Visibility(
                visible: majorList.isEmpty ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextApp.customText(
                        text: 'إستشارة مدتها 30 دقيقة',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: ColorsApp.primary_color),
                    customPriceField(
                      controller: firstPriceController,
                      onChanged: (val) {
                        setState(() {
                          updateFirstConsulting(val);
                        });
                      },
                    ),
                    TextApp.customText(
                        text: 'ر س',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: ColorsApp.primary_color),
                  ],
                ),
              ),
              Visibility(
                  visible: majorList.isEmpty ? false : true,
                  child: TextApp.smallheightSpace(10)),
              Visibility(
                visible: majorList.isEmpty ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextApp.customText(
                        text: 'إستشارة مدتها 60 دقيقة',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: ColorsApp.primary_color),
                    customPriceField(
                      controller: secondPriceController,
                      onChanged: (val) {
                        setState(() {
                          updateSecondConsulting(val);
                        });
                      },
                    ),
                    TextApp.customText(
                        text: 'ر س',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: ColorsApp.primary_color),
                  ],
                ),
              ),
              Visibility(
                  visible: majorList.isEmpty ? false : true,
                  child: TextApp.smallheightSpace(10)),
              Visibility(
                visible: majorList.isEmpty ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextApp.customText(
                        text: 'إستشارة مدتها 90 دقيقة',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: ColorsApp.primary_color),
                    customPriceField(
                      controller: thirdPriceController,
                      onChanged: (val) {
                        setState(() {
                          updateThirdConsulting(val);
                        });
                      },
                    ),
                    TextApp.customText(
                        text: 'ر س',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: ColorsApp.primary_color),
                  ],
                ),
              ),
              TextApp.smallheightSpace(10),
              customButton(
                text: 'التالي',
                color: ColorsApp.primary_color,
                textColor: Colors.white,
                height: 56.h,
                onTap: () async {
                  print(majorList);
                  if (majorList.isEmpty) {
                    HandleError.showToasts(msg: 'حدد تخصصك', color: Colors.red);
                  } else if (firstPriceController.text.isEmpty ||
                      firstPriceController.text == null) {
                    HandleError.showToasts(
                        msg: 'حدد سعر استشارة 30 دقيقة', color: Colors.red);
                  } else if (secondPriceController.text.isEmpty ||
                      secondPriceController.text == null) {
                    HandleError.showToasts(
                        msg: 'حدد سعر استشارة 60 دقيقة', color: Colors.red);
                  } else if (thirdPriceController.text.isEmpty ||
                      thirdPriceController.text == null) {
                    HandleError.showToasts(
                        msg: 'حدد سعر استشارة 90 دقيقة', color: Colors.red);
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        consultingPrice
                            .signConsultingPrice(
                          lawyerID: Api.registerID,
                          consultingDetail: majorList,
                        )
                            .then((value) {
                          setState(() {
                            isLoading = false;
                            if (value == null) {
                              HandleError.showToasts(
                                  msg: 'حدث خطأ', color: Colors.red);
                            } else {
                              widget.pageController.nextPage(
                                  duration: const Duration(microseconds: 100),
                                  curve: Curves.bounceIn);
                            }
                          });
                        });
                      });
                    });
                  }
                },
              ),
              TextApp.smallheightSpace(10),
            ],
          ),
        ),
        if (isLoading)
          AbsorbPointer(
            child: Center(
              child: SpinKitCircle(
                color: ColorsApp.primary_color,
                size: 30.h,
              ),
            ),
          ),
      ],
    );
  }
}

class customCheckBox extends StatelessWidget {
  customCheckBox({super.key, required this.isClicked, required this.onClick});
  bool isClicked;
  VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 18.h,
        width: 18.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsApp.primary_color, width: 1),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Container(
          height: 18.h,
          width: 18.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isClicked == true ? ColorsApp.primary_color : Colors.white,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}
