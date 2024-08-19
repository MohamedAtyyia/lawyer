import 'dart:developer';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/colors.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/text.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/Auth/Auth.dart';
import 'package:al_mostashar_lawyer/MODEL/agent/agent_document_model.dart';
import 'package:al_mostashar_lawyer/VIEW/Component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllAgentOrdersScreen extends StatefulWidget {
  const AllAgentOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AllAgentOrdersScreen> createState() => _AllAgentOrdersScreenState();
}

class _AllAgentOrdersScreenState extends State<AllAgentOrdersScreen> {
  Auth authController = Get.put(Auth());
  bool isLoading = false;

  void _finishDoc(String id) async {
    isLoading = true;
    setState(() {});

    await authController.finishDoc(id).then((value) {
      isLoading = false;
      setState(() {});
      HandleError.showToasts(
        msg: value.toString(),
        color: Colors.green,
      );
    }).catchError(
      (error) {
        isLoading = false;
        setState(() {});
        HandleError.showToasts(
          msg: error.toString(),
          color: Colors.red,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return customBlurryModal(
      isLoading: isLoading,
      circleSize: 30,
      widget: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorsApp.primary_color,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: TextApp.customText(
            text: 'جميع طلبات الوكيل',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: ColorsApp.primary_color,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: authController.getAllAgentDocs(Api.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return HandleError.aboutShimmer;
                  } else if (snapshot.hasError) {
                    return HandleError.checkInternetConnection;
                  } else if (snapshot.hasData) {
                    List<AgentDocumentModel> items = (snapshot.data as List)
                        .map((e) => AgentDocumentModel.fromJson(e))
                        .toList();
                    if (items.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text(
                            'لا يوجد طلبات',
                            style: TextStyle(
                              color: ColorsApp.primary_color,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(items[index].description),
                              subtitle: Text(items[index].documentationType),
                              trailing: IconButton(
                                onPressed: () {
                                  _finishDoc(
                                      items[index].documentationContractId);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: ColorsApp.primary_color,
                                ),
                              ),
                              leading: Text(items[index].request.toString()),
                            );
                          },
                        ),
                      );
                    }
                  }
                  return HandleError.aboutShimmer;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
