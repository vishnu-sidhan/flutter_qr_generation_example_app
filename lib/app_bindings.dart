import 'package:flutter_qr_generation_example_app/homepage/home_controller.dart';
import 'package:flutter_qr_generation_example_app/logindetailspage/login_details_controller.dart';
import 'package:flutter_qr_generation_example_app/loginpage/login_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginDetailsController());
  }
}
