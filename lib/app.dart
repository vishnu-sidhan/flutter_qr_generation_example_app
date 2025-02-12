import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/app_bindings.dart';
import 'package:flutter_qr_generation_example_app/app_theme.dart';
import 'package:flutter_qr_generation_example_app/homepage/home_page.dart';
import 'package:flutter_qr_generation_example_app/loginpage/login_page.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      home: const HomePage(),
    );
  }
}
