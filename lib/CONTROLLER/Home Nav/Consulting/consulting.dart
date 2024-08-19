import 'dart:io';
import 'package:al_mostashar_lawyer/MODEL/Consulting/canceled_consulting.dart';
import 'package:al_mostashar_lawyer/MODEL/Consulting/delegation_request.dart';
import 'package:al_mostashar_lawyer/MODEL/Consulting/ended_consulting.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../MODEL/Consulting/consulting_detail.dart';
import '../../../MODEL/Consulting/current_consulting.dart';
import '../../../MODEL/Consulting/general_consulting.dart';
import '../../../MODEL/Consulting/main_consulting.dart';
import '../../../MODEL/Consulting/private_consulting.dart';
import '../../../MODEL/Consulting/search_result.dart';
import '../../App Constant/api.dart';
import '../../App Constant/handle_error.dart';

class ConsultingController extends GetxController {
  Future<List<GeneralConsultingModel?>?> getGeneralConsulting(
      {required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.generalConsulting}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data['value'];
        return body.map((e) => GeneralConsultingModel.fromJson(e)).toList();
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<PrivateConsultingModel?>?> getPrivateConsulting(
      {required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.privateConsulting}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data['value'];
        return body.map((e) => PrivateConsultingModel.fromJson(e)).toList();
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<CurrentConsulting?>?> getCurrentConsulting(
      {required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.currentConsulting}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => CurrentConsulting.fromJson(e)).toList();
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<EndedConsultingModel?>?> getEndedConsulting(
      {required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.endedConsulting}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => EndedConsultingModel.fromJson(e)).toList();
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<CanceledConsultingModel?>?> getCanceledConsulting(
      {required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.canceledConsulting}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => CanceledConsultingModel.fromJson(e)).toList();
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future approveConsulting(
      {required String consultingID, required String lawyerID}) async {
    try {
      const url = '${Api.baseUrl}${Api.approveConsulting}';
      final dio = dios.Dio();
      dios.Response response;
      final data = dios.FormData.fromMap(
          {'ConsultingId': consultingID, 'LawyerId': lawyerID});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } catch (e) {
      if (e is SocketException) {
        return null;
      }
    }
    return null;
  }

  Future submitOffer(
      {required String consultingID,
      required String lawyerID,
      required String userID,
      required String price}) async {
    try {
      const url = '${Api.baseUrl}${Api.submitOffer}';
      final dio = dios.Dio();
      dios.Response response;
      final data = dios.FormData.fromMap({
        'CreatedBy': price,
        'ConsultingId': consultingID,
        'UserId': userID,
        'LawyerId': lawyerID
      });
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } catch (e) {
      if (e is SocketException) {
        return null;
      }
    }
    return null;
  }

  Future rejectConsulting(
      {required String consultingID, required String lawyerID}) async {
    try {
      const url = '${Api.baseUrl}${Api.rejectConsulting}';
      final dio = dios.Dio();
      dios.Response response;
      final data = {'ConsultingId': consultingID, 'LawyerId': lawyerID};
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } catch (e) {
      if (e is SocketException) {
        return null;
      }
    }
    return null;
  }

  Future approveDelegationOffer(
      {required String consultingID,
      required String id,
      required String price}) async {
    try {
      const url = '${Api.baseUrl}${Api.approveDelegation}';
      final dio = dios.Dio();
      dios.Response response;
      final data = dios.FormData.fromMap({
        'ConsultingId': consultingID,
        'DelegationAskLawyerReplyBack': 'مقبول',
        'DelegationValueSentFromLawyer': price,
        'userid': id,
      });
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        HandleError.showToasts(
            msg: 'تم تقديم العرض بنجاح', color: Colors.green);
        return body;
      } else if (response.statusCode == 400) {
        final body = response.data;
        HandleError.showToasts(
            msg: ' تم ارسال عرض سعر من قبل', color: Colors.green);
        return body;
      }
    } on dios.DioError catch (e) {
      debugPrint(e.response!.statusCode.toString());
      HandleError.showToasts(
          msg: 'لقد تم ارسال عرض سعر من قبل', color: Colors.green);
    }
    return null;
  }

  Future lawyerAppoints(
      {required List<Map> appoints, required String lawyerID}) async {
    //         print('<>>>>>>>>>>>>>>>>>>>');
    // print(lawyerID);
    // for (int i = 0; i < appoints.length; i++) {
    //   print(appoints[i].toString());
    // }
    // print('>>>>>>>>>>>>>>>>>>');

    try {
      const url = '${Api.baseUrl}${Api.lawyerDate}';
      final dio = dios.Dio();
      dios.Response response;
      final data = {"LawyerId": lawyerID, "DayDetails": appoints};
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        print(body.toString());
        return body;
      }
    } catch (e) {
      if (e is SocketException) {
        return null;
      }
    }
    return null;
  }

  Future<List<DelegationRequestModel?>?> getDelegationRequest(
      {required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.delegationRequest}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data['value'];
        return body.map((e) => DelegationRequestModel.fromJson(e)).toList();
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<ConsultingDetail?>? consultingDetail(
      {required String consultingID, required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.consultingDetail}';
      final dio = dios.Dio();
      dios.Response response;
      final data = dios.FormData.fromMap({
        'id': consultingID,
        'userid': id,
      });
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return ConsultingDetail.fromJson(body);
      }
    } catch (e) {
      if (e is SocketException) {
        return null;
      }
    }
    return null;
  }

  Future<List<SearchResult?>?> searchConsulting(
      {required String text, required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.searchResult}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({
        'id': text,
        'userid': id,
      });
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data['value'];
        return body.map((e) => SearchResult.fromJson(e)).toList();
      }
    } catch (e) {
      if (e is SocketException) {
        return null;
      }
    }
    return null;
  }

  Future deActiveLawyerAccount({required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.deActiveLawyerAccount}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future ActiveLawyerAccount({required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.ActiveLawyerAccount}';
      final dio = dios.Dio();

      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      } else if (response.statusCode == 400) {}
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<MainConsultingModel?>?> getConsulting(
      {required String id}) async {
    try {
      const url = '${Api.baseUrl}${Api.mainConsulting}';
      final dio = dios.Dio();
      dios.Response response;
      final data = dios.FormData.fromMap({'id': id});
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => MainConsultingModel.fromJson(e)).toList();
      }
    } catch (e) {
      if (e is SocketException) {
        return null;
      }
    }
    return null;
  }
}
