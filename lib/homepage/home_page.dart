import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/app_template.dart';
import 'package:flutter_qr_generation_example_app/homepage/home_controller.dart';
import 'package:flutter_qr_generation_example_app/logindetailspage/login_details_page.dart';
import 'package:flutter_qr_generation_example_app/widgets/qr_container.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        title: "PLUGIN",
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Spacer(),
              Stack(clipBehavior: Clip.none, children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 175,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          stops: const [1.0, 0.0],
                          colors: [Colors.indigo.shade700, Colors.black]),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Generated Number",
                        textScaler: TextScaler.linear(1.5),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        controller.randomNumber,
                        textScaler: const TextScaler.linear(3),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 100,
                    top: -115,
                    child: QrContainer(qrPainter: controller.qrPainter))
              ]),
              const Spacer(),
              OutlinedButton(
                onPressed: () => Get.to(() => const LoginDetailsPage()),
                child: Obx(() => Text(
                    "Last Login at ${controller.lastLoginDetail.value?.date ?? ""}")),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: controller.onPressedSave,
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text("Save"))))
            ],
          ),
        ));
  }
}
