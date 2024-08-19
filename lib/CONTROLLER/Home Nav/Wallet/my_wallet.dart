import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dio/dio.dart';
import '../../../MODEL/Wallet/my_wallet.dart';
import '../../App Constant/api.dart';

class MyWalletController extends GetxController {
  Future<MyWalletModel?>? getData({required String id}) async {
    const url = '${Api.baseUrl}${Api.myWallet}';
    Dio dio = await Dio()
      ..interceptors.add(LogInterceptor(
          request: true, error: true, requestBody: true, responseBody: true));
    final data = FormData.fromMap({
      'id': id,
    });
    try {
      var response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        print(body.toString());
        return MyWalletModel.fromJson(body);
      }
    } catch (e) {}
    return null;
  }
}
