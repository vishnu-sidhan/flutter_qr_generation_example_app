import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/app_template.dart';
import 'package:flutter_qr_generation_example_app/loginpage/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        title: "LOGIN",
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                const Text("Phone Number"),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.mobileNumber,
                ),
                const SizedBox(height: 10),
                const Text("OTP"),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.otp,
                ),
                const Spacer(flex: 1),
                Center(
                  child: ElevatedButton(
                      onPressed: controller.onPressedButton,
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Obx(() => Text(controller.toLogin.value
                              ? "Verify OTP"
                              : "Send OTP")),
                        ),
                      )),
                ),
                const SizedBox(height: 25),
                Center(
                  child: Obx(() => controller.toLogin.value
                      ? Column(
                          children: [
                            Text("0:${controller.resendOtpTimer.value}"),
                            TextButton(
                                onPressed: controller.resendOtpTimer.value == 0
                                    ? controller.onPressedButton
                                    : null,
                                child: const Text("Resend OTP")),
                          ],
                        )
                      : const SizedBox.shrink()),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ));
  }
}
