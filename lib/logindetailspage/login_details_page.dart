import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/app_template.dart';
import 'package:flutter_qr_generation_example_app/logindetailspage/login_details_controller.dart';
import 'package:flutter_qr_generation_example_app/logindetailspage/login_details_list_widget.dart';
import 'package:get/get.dart';

class LoginDetailsPage extends GetView<LoginDetailsController> {
  const LoginDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: AppTemplate(
          title: "Last Login",
          child: Column(
            children: [
              TabBar(
                  tabs: const ["TODAY", "Yesterday", "Others"]
                      .map((e) => Tab(text: e))
                      .toList()),
              const SizedBox(height: 15),
              TabBarView(children: [
                LoginDetailsListWidget(future: controller.fetchTodayLogin()),
                LoginDetailsListWidget(
                    future: controller.fetchYesterdayLogin()),
                LoginDetailsListWidget(future: controller.fetchOthersLogin()),
              ]),
            ],
          )),
    );
  }
}
