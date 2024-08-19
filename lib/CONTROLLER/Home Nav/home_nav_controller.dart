import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../VIEW/Home Nav/Chat/chat.dart';
import '../../VIEW/Home Nav/Home Page/home_page.dart';
import '../../VIEW/Home Nav/More/more.dart';
import '../../VIEW/Home Nav/My Consulting/my_consulting.dart';
import '../../VIEW/Home Nav/My Wallet/wallet.dart';

class HomeNavController extends GetxController {
  int itemSelected = 0;
  List<Widget> listScreen = [
    HomePage(),
    MyConsulting(),
    // Chat(),
    Wallet(),
    More(),
  ];
}
