import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/MODEL/About/reted_office.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../CONTROLLER/About/About.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../Component/component.dart';

class ApprovedOffices extends StatelessWidget {
  ApprovedOffices({Key? key}) : super(key: key);
  final About about = Get.put(About());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                  ),
                ),
                TextApp.customText(
                  text: 'التقييمات',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 50.w,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 130.h, bottom: 20.h, right: 16.w, left: 16.w),
              child: FutureBuilder<List<RatedOfficeModel?>?>(
                future: about.getRatedOffice(id: Api.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return HandleError.checkInternetConnection;
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return HandleError.chooseLawyer;
                  }

                  List<RatedOfficeModel?>? item = snapshot.data;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: item!.length,
                    itemBuilder: (context, index) {
                      return customLawyerCard4(
                        text:
                            '${item[index]!.createdBy ?? ''} ${item[index]!.updatedBy ?? ''}',
                        image:
                            '${Api.upload}${item[index]!.evaluaterImage ?? ''}',
                        starRate: item[index]!.startsNo ?? '',
                        desc: item[index]!.evaluationText ?? '',
                        date: DateFormat.yMd().format(
                          DateTime.parse(item[index]!.createdDate!),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
