import 'dart:math';

import 'package:flutter_qr_generation_example_app/loginpage/login_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    randomNumber.value = generateRandomNumber();
    super.onInit();
  }

  void onPressedLogout() {
    Get.offAll(const LoginPage());
  }

  final randomNumber = 0.obs;

  int generateRandomNumber() {
    int val = Random().nextInt(90000) + 10000;
    return val;
  }
}
