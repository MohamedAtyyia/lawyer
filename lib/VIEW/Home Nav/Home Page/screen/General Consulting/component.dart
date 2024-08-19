import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/image.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';
import '../../../../../CONTROLLER/Home Nav/methods.dart';
import '../../../../Component/component.dart';
import '../hero_image.dart';

class WithNoAttach extends StatelessWidget {
  const WithNoAttach({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 93.h,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextApp.customText(
            text: 'لم يقم العميل بإرفاق ملفات او صوتيات مع الإستشارة',
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            height: 1.5,
            color: ColorsApp.default_color),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  CustomField(
      {super.key,
      required this.fileUrl,
      required this.imageUrl,
      required this.splittedFile});
  String splittedFile;
  String fileUrl;
  String imageUrl;
  Methods methods = Get.put(Methods());
  @override
  Widget build(BuildContext context) {
    return showFileInConsulting(
      onTap: () {
        splittedFile == 'pdf'
            ? methods.DownloadFile(fileUrl: fileUrl)
            : Get.to(() => HeroNetworkImage(image: imageUrl));
      },
      child: splittedFile == 'pdf'
          ? customPDFFile()
          : customCasheImage(image: imageUrl),
    );
  }
}

CustomBottomSheet(BuildContext context, TextEditingController priceController,
    VoidCallback onTap) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 20.h,
                right: 20.w,
                left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 280.w,
                  margin: EdgeInsets.only(bottom: 50.h),
                  child: TextApp.customText(
                      text:
                          'اضف المبلغ التي تود الحصول عليه عند قبولك التفويض في هذه القضية',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: ColorsApp.primary_color),
                ),
                customTextFiled(
                  text: 'اكتب المبلغ بالريال السعودي',
                  controller: priceController,
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'ادخل المبلغ';
                    }
                  },
                ),
                TextApp.smallheightSpace(50),
                customButton(
                  text: 'ارساله الي العميل',
                  color: ColorsApp.primary_color,
                  textColor: Colors.white,
                  height: 56.h,
                  onTap: onTap,
                ),
                TextApp.smallheightSpace(20),
              ],
            ),
          ));
}

CustomOfferBottomSheet(BuildContext context,
    TextEditingController priceController, VoidCallback onTap) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 20.h,
                right: 20.w,
                left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 280.w,
                  margin: EdgeInsets.only(bottom: 50.h),
                  child: TextApp.customText(
                      text:
                          'اضف المبلغ التي تود الحصول عليه عند قبولك هذه الإستشارة',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: ColorsApp.primary_color),
                ),
                customTextFiled(
                  text: 'اكتب المبلغ بالريال السعودي',
                  controller: priceController,
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'ادخل المبلغ';
                    }
                  },
                ),
                TextApp.smallheightSpace(50),
                customButton(
                  text: 'ارساله الي العميل',
                  color: ColorsApp.primary_color,
                  textColor: Colors.white,
                  height: 56.h,
                  onTap: onTap,
                ),
                TextApp.smallheightSpace(20),
              ],
            ),
          ));
}

class RejectConsulting extends StatelessWidget {
  RejectConsulting({super.key, required this.onTap});
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: customButton(
        text: 'رفض',
        color: const Color(0xffDDB9561A).withOpacity(0.2),
        textColor: ColorsApp.default_color,
        height: 56.h,
        onTap: () {
          Get.defaultDialog(
            title: '',
            contentPadding: const EdgeInsets.symmetric(horizontal: 50),
            content: Column(
              children: [
                Lottie.asset(
                  ImageApp.lottieyellowalert,
                  height: 155.h,
                  width: 138.w,
                ),
                TextApp.smallheightSpace(21),
                SizedBox(
                  child: TextApp.customText(
                      text: 'هل انت متاكد من رفض الإستشارة',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: ColorsApp.primary_color,
                      textAlign: TextAlign.center),
                ),
                TextApp.smallheightSpace(31),
                Row(
                  children: [
                    Expanded(
                      child: customButton(
                        text: 'نعم , رفض',
                        onTap: onTap,
                        color: ColorsApp.primary_color,
                        height: 49.h,
                        textColor: Colors.white,
                      ),
                    ),
                    TextApp.smallwidthSpace(20),
                    Expanded(
                      child: customButton(
                        text: 'لا , رجوع',
                        textColor: Colors.grey,
                        onTap: () {
                          Get.back();
                        },
                        color: Colors.grey.shade300,
                        height: 49.h,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Notes extends StatelessWidget {
  Notes({super.key, required this.notes});
  String notes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, bottom: 30.h),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            text: TextSpan(
                text: notes,
                style: TextStyle(
                    fontFamily: 'tajwal',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: Colors.grey)),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: TextApp.customText(
        text: title,
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
        color: ColorsApp.primary_color,
      ),
    ),
  );
}
