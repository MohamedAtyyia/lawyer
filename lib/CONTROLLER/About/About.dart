import 'package:al_mostashar_lawyer/MODEL/About/reted_office.dart';
import 'package:dio/dio.dart' as dios;
import 'package:get/get.dart';
import '../../MODEL/About/about_model.dart';
import '../../MODEL/About/notification_model.dart';
import '../../MODEL/About/privacy_model.dart';
import '../../MODEL/About/terms_condition.dart';
import '../App Constant/api.dart';

class About extends GetxController {
  Future<List<TermsAndConditionModel?>?> getTerms({required String id}) async {
    const url = '${Api.baseUrl}${Api.termsAndCondition}';
    final dio = dios.Dio();

    final data = dios.FormData.fromMap({'id': id});
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => TermsAndConditionModel.fromJson(e)).toList();
      }
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<PrivacyPolicyModel?>?> getPrivacy({required String id}) async {
    const url = '${Api.baseUrl}${Api.privacy}';
    final dio = dios.Dio();

    final data = dios.FormData.fromMap({'id': id});
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => PrivacyPolicyModel.fromJson(e)).toList();
      }
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<AboutAppModel?>?> getAbout({required String id}) async {
    const url = '${Api.baseUrl}${Api.aboutApp}';
    final dio = dios.Dio();

    final data = dios.FormData.fromMap({'id': id});
    dios.Response response;
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => AboutAppModel.fromJson(e)).toList();
      }
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<RatedOfficeModel?>?> getRatedOffice({required String id}) async {
    const url = '${Api.baseUrl}${Api.ratedOffice}';
    final dio = dios.Dio();

    dios.Response response;
    final data = dios.FormData.fromMap({
      'id': id,
    });
    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        List body = response.data;
        print('BODY >>>>>>>>>>>>>>> ${body.toString()}');
        return body.map((e) => RatedOfficeModel.fromJson(e)).toList();
      }
    } on dios.DioError catch (e) {}
    return null;
  }

  Future<List<NotificationModel?>?> getNotification(
      {required String userID}) async {
    final url = '${Api.baseUrl}${Api.getNotification}$userID';
    final dio = dios.Dio();

    dios.Response response;
    try {
      response = await dio.get(url);
      if (response.statusCode == 200) {
        List body = response.data;
        return body.map((e) => NotificationModel.fromJson(e)).toList();
      }
    } on dios.DioError catch (e) {}
    return null;
  }
}
