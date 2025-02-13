import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/app_template.dart';
import 'package:flutter_qr_generation_example_app/homepage/home_controller.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
                        controller.randomNumber.value.toString(),
                        textScaler: const TextScaler.linear(3),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 75,
                    top: -105,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: QrImageView(
                        size: 150,
                        backgroundColor: Colors.white,
                        data: controller.randomNumber.value.toString(),
                      ),
                    ))
              ]),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Last Login at"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {},
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text("Save"))))
            ],
          ),
        ));
  }
}
