import 'package:al_mostashar_lawyer/CONTROLLER/Auth/Auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../CONTROLLER/App Constant/api.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/handle_error.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../MODEL/Consulting/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  ConsultingController consultingController = Get.put(ConsultingController());
  Auth auth = Get.put(Auth());

  String text = '';

  int isClicked = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextApp.customText(
            text: 'البحث',
            fontWeight: FontWeight.w700,
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
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
        child: ListView(
          children: [
            // SearchBar(
            //   controller: searchController,
            //   onChange: (val) {
            //     setState(() {
            //       text = val;
            //     });
            //   },
            // ),
            TextApp.smallheightSpace(36),
            text.isEmpty
                ? const SizedBox()
                : FutureBuilder<List<SearchResult?>?>(
                    future: consultingController.searchConsulting(
                        text: text, id: Api.id),
                    builder: (context, snapshot) {
                      List<SearchResult?>? items = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: items!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  auth
                                      .getPersonalData(id: Api.id)
                                      .then((value) {
                                    if (value == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: TextApp.customText(
                                            text: 'حدث خطأ',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                        backgroundColor:
                                            ColorsApp.primary_color,
                                      ));
                                    } else {
                                      Get.defaultDialog(
                                        backgroundColor:
                                            ColorsApp.primary_color,
                                        title: 'بيانات العميل',
                                        titleStyle: const TextStyle(
                                            fontFamily: 'tajwal',
                                            color: Colors.white),
                                        content: UserDialogContent(
                                          name:
                                              '${items[index]!.userFirstName ?? ''} ${items[index]!.userFamilyName ?? ''}',
                                          imageUrl:
                                              '${Api.upload}${items[index]!.userImage ?? ''}',
                                          email: value.email!,
                                          phone: value.phoneNumber!,
                                        ),
                                      );
                                    }
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextApp.customText(
                                            text:
                                                '${items[index]!.userFirstName ?? ''} ${items[index]!.userFamilyName ?? ''}',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.grey),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.grey.shade300,
                                        ),
                                      ],
                                    ),
                                    TextApp.smallheightSpace(10),
                                    Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return HandleError.checkInternetConnection;
                      }
                      return HandleError.circleIndicator2;
                    }),
          ],
        ),
      ),
    );
  }
}

class UserDialogContent extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  const UserDialogContent(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.email,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.default_color),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl),
                        fit: BoxFit.cover)),
              ),
              TextApp.smallwidthSpace(16),
              TextApp.customText(
                  text: name,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.white)
            ],
          ),
          TextApp.smallheightSpace(20),
          TextApp.customText(
              text: 'البريد الإلكتروني : ',
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: Colors.white),
          TextApp.smallheightSpace(10),
          TextApp.customText(
              text: email,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
              color: Colors.white),
          TextApp.smallheightSpace(10),
          TextApp.customText(
              text: 'رقم الجوال : ',
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: Colors.white),
          TextApp.smallheightSpace(10),
          TextApp.customText(
              text: phone,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
              color: Colors.white),
        ],
      ),
    );
  }
}
