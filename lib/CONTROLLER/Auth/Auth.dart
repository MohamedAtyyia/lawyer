import 'dart:developer';
import 'dart:io';

import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/main.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MODEL/About/my_personal_data.dart';
import '../../VIEW/Auth/Forget Password/forget_password2.dart';
import '../../VIEW/Auth/Forget Password/forget_password3.dart';
import '../../VIEW/Auth/Forget Password/verify_change_password.dart';
import '../../VIEW/Auth/login/login_screen.dart';
import '../../VIEW/Home Nav/home_nav.dart';

class Auth extends GetxController {
  Future getToken({required String token, required String userID}) async {
    const url = '${Api.baseUrl}${Api.getToken}';
    final data = {"Token": token, "userId": userID};
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError {}
  }

  Future login({required String userName, required String password}) async {
    const url = '${Api.baseUrl}${Api.login}';
    final data = {
      "UserName": userName,
      "Password": password,
      "Role": "المحامي",
    };
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        await pref!.setString('id', body['id']);
        await pref!.setString('name', body['firstName']);
        await pref!.setString('phone', body['normalizedUserName']);
        String? a = await pref!.getString('id');
        Api.id = a!;
        Get.offAll(() => const HomeNav());
        return body;
      }
    } on dios.DioError {}
  }

  Future register({
    required String userName,
    required String firstName,
    required String familyName,
    required String email,
    required String desc,
    required String password,
    required String phone,
  }) async {
    const url = '${Api.baseUrl}${Api.register}';
    final data = dios.FormData.fromMap({
      "UserName": userName,
      "FirstName": firstName,
      "FamilyName": familyName,
      "Email": email,
      "Password": password,
      "PhoneNumber": phone,
      "UserType": 'المحامي',
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        await Future.wait(
          [
            pref!.setString('registerID', body['id']),
            pref!.setString('phone', body['normalizedUserName']),
            pref!.setBool('otpDone', false),
          ],
        );
        return body;
      }
    } on dios.DioError catch (e) {
      log('Register Dio Error $e');
      log('Register Dio Error Response Data${e.response!.data}');
      log('Register Dio Error Response Code ${e.response!.statusCode}');
    }
  }

  Future editInfo({
    required String id,
    required String fName,
    required String faName,
    required String email,
    required String phone,
    required String identifyId,
  }) async {
    const url = '${Api.baseUrl}${Api.editInfo}';
    final data = dios.FormData.fromMap(
      {
        "id": id,
        "FirstName": fName,
        "FamilyName": faName,
        "Email": email,
        "PhoneNumber": phone,
        "IdentityDocumentA": 'file',
        "IdentityId": identifyId,
      },
    );
    await pref!.setString('IdentityId', identifyId);
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError {}
  }

  Future uploadFile(
      {required String id,
      List<String>? doc1,
      List<String>? doc2,
      List<String>? doc3}) async {
    const url = '${Api.baseUrl}${Api.lawayerFile}';

    final data = dios.FormData.fromMap({
      "Id": id,
      "DocumentA": [
        for (var item in doc1!)
          await dios.MultipartFile.fromFile(item,
              filename: item.split('/').last)
      ],
      "DocumentB": [
        for (var item in doc2!)
          await dios.MultipartFile.fromFile(item,
              filename: item.split('/').last)
      ],
      "DocumentC": [
        for (var item in doc3!)
          await dios.MultipartFile.fromFile(item,
              filename: item.split('/').last)
      ],
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError {}
  }

  Future uploadPersonalImage({
    required String id,
    required String image,
  }) async {
    const url = '${Api.baseUrl}${Api.changePersonalImage}';

    final data = dios.FormData.fromMap({
      "Id": id,
      "PersonalImage": await dios.MultipartFile.fromFile(image,
          filename: image.split('/').last),
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError {}
  }

  Future signConsultingPrice(
      {required String lawyerID,
      required List<Map<String, dynamic>> consultingDetail}) async {
    const url = '${Api.baseUrl}${Api.signConsultingPrice}';
    final data = {
      "LawyerId": lawyerID,
      "LawyerConsultDetails": consultingDetail
    };
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError {}
  }

  Future sendVerificationOTP(String phoneNumber) async {
    const url = '${Api.baseUrl}${Api.sendOTP}';
    log('PhoneNumber $phoneNumber');
    final data = dios.FormData.fromMap(
      {
        "UserName": phoneNumber,
      },
    );
    await pref!.setString('otpStatus', 'start');

    log('Send Verification Code Data ${data.fields}');
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      log('Send SendVerificationOTP Code Response ${response.data}');
      if (response.statusCode == 200) {
        final body = response.data;

        return body;
      }
    } on dios.DioError catch (e) {
      log('SendVerificationOTP Dio Error $e');
      log('SendVerificationOTP Dio Error Response Data ${e.response!.data}');
      log('SendVerificationOTP Dio Error Status Code ${e.response!.statusCode}');
    }
  }

  Future verifyPhone({required String userName, required String otp}) async {
    const url = '${Api.baseUrl}${Api.verifyPhone}';
    final data = dios.FormData.fromMap({
      "UserName": userName,
      "OTP": otp,
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        Get.offAll(() => LoginScreen());
        pref!.remove('registerID');
        pref!.remove('phone');
        return body;
      }
    } on dios.DioError {}
  }

  Future verifyPhone2({required String userName, required String otp}) async {
    const url = '${Api.baseUrl}${Api.verifyPhone}';
    final data = dios.FormData.fromMap({
      "UserName": userName,
      "OTP": otp,
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        Get.offAll(() => ForgetPassword3(
              userName: userName,
            ));
        pref!.remove('registerID');
        pref!.remove('phone');
        return body;
      }
    } on dios.DioError {}
  }

  Future forgetPassword(
      {required String UserName, required String phoneNumber}) async {
    const url = '${Api.baseUrl}${Api.forgetPassword}';
    final data = dios.FormData.fromMap({
      "UserName": UserName,
      "phonenumber": phoneNumber,
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        pref!.setString('token', body['token']);
        Get.to(() => ForgetPassword2(
              userName: UserName,
              phone: phoneNumber,
            ));
        return body;
      }
    } on dios.DioError {}
  }

  Future changePassword(
      {required String UserName,
      required String newPassword,
      required String repeatNewPassword,
      required String token}) async {
    const url = '${Api.baseUrl}${Api.changePassword}';
    final data = dios.FormData.fromMap({
      "UserName": UserName,
      "NewPassword": newPassword,
      "RepeatNewPassword": repeatNewPassword,
      "token": token,
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        Get.offAll(() => const ChangePasswordComplete());
        return body;
      }
    } on dios.DioError {}
  }

  Future changePasswordWithoutToken({
    required String UserName,
    required String newPassword,
    required String repeatNewPassword,
  }) async {
    const url = '${Api.baseUrl}${Api.changePasswordWithoutToken}';
    final data = dios.FormData.fromMap({
      "UserName": UserName,
      "NewPassword": newPassword,
      "RepeatNewPassword": repeatNewPassword,
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError {}
  }

  Future<MyPersonalDataModel?> getPersonalData({required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.myPersonalData}';
      final dio = dios.Dio();
      // DioCacheManager dioCasheManager = DioCacheManager(
      //     CacheConfig(baseUrl: url, defaultRequestMethod: "POST"));
      // dios.Options myOption =
      //     buildCacheOptions(const Duration(days: 30), forceRefresh: true);
      // dio.interceptors.add(dioCasheManager.interceptor);
      dios.Response response;
      final data = dios.FormData.fromMap({"id": id});
      response = await dio.post(url, data: data);
      log('Get All Personal Data ${response.data}');
      if (response.statusCode == 200) {
        final body = MyPersonalDataModel.fromJson(response.data);
        return body;
      }
    } on dios.DioError {}
    return null;
  }

  Future officeApprovalRequest({
    required String id,
    required String phone,
    required String email,
    required String fName,
    required File doc,
    required File logo,
    required String city,
    required String region,
    required String officeName,
  }) async {
    const url = '${Api.baseUrl}${Api.officeApprovalRequest}';
    String File1 = doc.path.split('/').last;

    /**
     *   await dios.MultipartFile.fromFile(item,
                filename: item.split('/').last)
     */
    final data = dios.FormData.fromMap({
      "UserPhoneNumber": phone,
      "approvedOfficeName": officeName,
      "UserEmail": email,
      "UserFirsName": fName,
      "userid": id,
      "areaName": region,
      "cityName": city,
      "DocumentA": await dios.MultipartFile.fromFile(doc.path,
          filename: doc.path.split('/').last),
      "approvedOfficeLogo": await dios.MultipartFile.fromFile(logo.path,
          filename: logo.path.split('/').last),
      // "DocumentA": doc,
      // "approvedOfficeLogo": logo,
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      debugPrint('officeApprovalRequest $response');
      debugPrint('officeApprovalRequest ${response.statusCode}');
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError catch (e) {
      debugPrint('officeApprovalRequest $e');
      debugPrint('officeApprovalRequest ${e.message}');
      debugPrint('officeApprovalRequest ${e.error}');
      debugPrint('officeApprovalRequest ${e.response}');
    }
  }

  Future agentApprovalRequest({
    required String phone,
    required String email,
    required String officeName,
    required String city,
    required String region,
    required String createdBy,
    required File docContract,
    required File officeLogo,
    required File docLogo,
  }) async {
    const url = '${Api.baseUrl}${Api.agentApprovalRequest}';

    final data = dios.FormData.fromMap({
      "PhoneNumber": phone,
      "Email": email,
      "OfficeName": officeName,
      "Region": region,
      "City": city,
      "CreatedBy": createdBy,
      "Image1": await dios.MultipartFile.fromFile(docContract.path,
          filename: docContract.path.split('/').last),
      "Image2": await dios.MultipartFile.fromFile(officeLogo.path,
          filename: officeLogo.path.split('/').last),
      "Image3": await dios.MultipartFile.fromFile(docLogo.path,
          filename: docLogo.path.split('/').last),
    });
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      debugPrint('agentApprovalRequest $response');
      debugPrint('agentApprovalRequest ${response.statusCode}');
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError catch (e) {
      debugPrint('agentApprovalRequest $e');
      debugPrint('agentApprovalRequest ${e.message}');
      debugPrint('agentApprovalRequest ${e.error}');
      debugPrint('agentApprovalRequest ${e.response}');
    }
  }

  Future getAllAgentDocs(String id) async {
    const url = '${Api.baseUrl}${Api.getAllDocAgent}';

    final data = {"id": id};
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.get(
        url,
        queryParameters: data,
      );
      print(response.data);
      print('...................');
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError catch (e) {
      log('getAllAgentDocs $e');
      log('getAllAgentDocs ${e.message}');
      log('getAllAgentDocs ${e.error}');
      log('getAllAgentDocs ${e.response}');
    }
  }

  Future finishDoc(String id) async {
    const url = '${Api.baseUrl}${Api.finishDoc}';

    final data = dios.FormData.fromMap({"id": id});

    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(
        url,
        data: data,
      );
      log('finishDoc $response');
      log('finishDoc ${response.statusCode}');
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError catch (e) {
      log('finishDoc $e');
      log('finishDoc ${e.message}');
      log('finishDoc ${e.error}');
      log('finishDoc ${e.response}');
    }
  }

  Future deleteAccount(
      {required String id,
      required String password,
      required String phone,
      required String reason}) async {
    const url = '${Api.baseUrl}${Api.deleteAccount}';
    final data = {
      "Id": id,
      "UserName": phone,
      "Password": password,
      "Reason": reason
    };
    final dio = dios.Dio();
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } on dios.DioError {}
  }
}
