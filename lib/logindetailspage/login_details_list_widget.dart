import 'package:flutter/material.dart';
import 'package:flutter_qr_generation_example_app/models/login_detail.dart';
import 'package:flutter_qr_generation_example_app/widgets/qr_container.dart';
import 'package:get/get.dart';

class LoginDetailsListWidget extends StatelessWidget {
  const LoginDetailsListWidget({super.key, required this.future});
  final Future<List<LoginDetail>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final loginDetails = snapshot.data!;
            return ListView.builder(
                itemCount: loginDetails.length,
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 100, bottom: 10, right: 10),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      clipBehavior: Clip.none,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(8)),
                          child: SizedBox(
                            width: Get.width - 25,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${loginDetails[i].date}"),
                                  Text("IP: ${loginDetails[i].ip}"),
                                  Text("${loginDetails[i].location}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 20,
                            bottom: 10,
                            child: QrContainer.url(
                                url: loginDetails[i].qrImageUrl))
                      ],
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
