import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../CONTROLLER/About/About.dart';
import '../../CONTROLLER/App Constant/api.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/handle_error.dart';
import '../../CONTROLLER/App Constant/image.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../../MODEL/About/privacy_model.dart';

class Policy extends StatelessWidget {
  Policy({super.key});
  About controller = Get.put(About());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 290.h,
            width: double.infinity,
            padding: EdgeInsets.only(top: 30.h, right: 20.w),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                TextApp.customText(
                    text: 'سياسة الخصوصية',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
                SizedBox(
                  width: 50.w,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: 100.h, left: 10.w, right: 10.w, bottom: 30.h),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white12,
                )),
            child: ListView(
              children: [
                SvgPicture.asset(ImageApp.logo),
                TextApp.smallheightSpace(30),
                FutureBuilder<List<PrivacyPolicyModel?>?>(
                    future: controller.getPrivacy(id: Api.id),
                    builder: (context, snapshot) {
                      List<PrivacyPolicyModel?>? item = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsApp.default_color,
                                  ),
                                ),
                                TextApp.smallwidthSpace(10),
                                SizedBox(
                                    width: 260.w,
                                    child: TextApp.customText(
                                        text: item[index]!
                                            .policiesAndPrivacyTitle!,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Colors.black,
                                        textAlign: TextAlign.justify))
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.h),
                          itemCount: item!.length,
                        );
                      } else if (snapshot.hasError) {
                        return HandleError.checkInternetConnection;
                      }
                      return HandleError.aboutShimmer;
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
