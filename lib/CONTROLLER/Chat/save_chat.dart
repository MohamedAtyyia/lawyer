import 'dart:io';
import 'package:get/get.dart';
import '../App Constant/api.dart';
import 'package:dio/dio.dart' as dios;

class SaveChat extends GetxController {
  Future sendMessage({
    required String ConsultingId,
    required String SenderId,
    required String SenderText,
    required File? RequestAudioo,
    required File? RequestDocumentt,
    required String RecieverId,
  }) async {
    try {
      const url = '${Api.baseUrl}${Api.saveChat}';
      final dio = dios.Dio();
      dios.Response response;
      final data = dios.FormData.fromMap({
        'ConsultingId': ConsultingId,
        'SenderId': SenderId,
        'SenderText': SenderText,
        'RequestAudioo': await dios.MultipartFile.fromFile(RequestAudioo!.path,
            filename: RequestAudioo.path.split('/').last),
        'RequestDocumentt': await dios.MultipartFile.fromFile(
            RequestDocumentt!.path,
            filename: RequestDocumentt.path.split('/').last),
        'RecieverId': RecieverId,
      });
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        return body;
      }
    } catch (e) {}
    return null;
  }
}
