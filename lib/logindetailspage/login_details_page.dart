import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/app_template.dart';
import 'package:flutter_qr_generation_example_app/logindetailspage/login_details_controller.dart';
import 'package:flutter_qr_generation_example_app/logindetailspage/login_details_list_widget.dart';
import 'package:get/get.dart';

class LoginDetailsPage extends StatelessWidget {
  const LoginDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginDetailsController(),
      builder: (controller) => AppTemplate(
        title: "Last Login",
        child: DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 325,
                  child: TabBar(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      dividerHeight: 0,
                      tabs: const ["TODAY", "Yesterday", "Others"]
                          .map((e) => Tab(text: e))
                          .toList()),
                ),
                SizedBox(
                  // width: context.width - 10,
                  height: context.height - 150,
                  child: TabBarView(children: [
                    LoginDetailsListWidget(
                        future: controller.fetchTodayLogin()),
                    LoginDetailsListWidget(
                        future: controller.fetchYesterdayLogin()),
                    LoginDetailsListWidget(
                        future: controller.fetchOthersLogin()),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
