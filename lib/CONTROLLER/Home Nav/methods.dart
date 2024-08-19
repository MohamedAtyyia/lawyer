import 'dart:math';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Methods extends GetxController {
  int randomNumber = 1;
  void generateRandomNumber() {
    Random random = Random();
    randomNumber = random.nextInt(450) + 1;
    update();
  }

  Future DownloadFile({required String fileUrl}) async {
    if (!await launchUrl(
      Uri.parse(fileUrl),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $fileUrl');
    }
  }
}
