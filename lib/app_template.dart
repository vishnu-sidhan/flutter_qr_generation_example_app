import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/loginpage/login_page.dart';
import 'package:get/get.dart';

class AppTemplate extends StatelessWidget {
  const AppTemplate({super.key, required this.child, required this.title});

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: title != "Last Login"
            ? null
            : IconButton(
                onPressed: Get.back,
                icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          SizedBox.square(
            dimension: 110,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(125),
              ),
              clipBehavior: Clip.antiAlias,
              child: ColoredBox(
                color: Colors.indigo.shade500,
                child: title == "LOGIN"
                    ? null
                    : TextButton(
                        onPressed: () => Get.offAll(() => const LoginPage()),
                        child: const Text("Logout")),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.indigo[700],
      bottomSheet: Stack(
        clipBehavior: Clip.none,
        children: [
          child,
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 32,
              top: -15,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                child: Text(title),
              )),
        ],
      ),
    );
  }
}
