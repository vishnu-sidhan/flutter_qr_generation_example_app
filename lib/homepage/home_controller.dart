import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_qr_generation_example_app/models/login_detail.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeController extends GetxController {
  late final LoginDetail loginDetail;
  Rxn<LoginDetail?> lastLoginDetail = Rxn();
  late final QrPainter qrPainter;
  late final String randomNumber;

  @override
  void onInit() {
    if (Get.arguments != null) {
      loginDetail = Get.arguments as LoginDetail;
    } else {
      loginDetail =
          LoginDetail(date: DateTime.now(), ip: "1.1.1.1", location: 'Chennai');
    }
    randomNumber = generateRandomNumber().toString();
    qrPainter = QrPainter(data: randomNumber, version: QrVersions.auto);
    super.onInit();
  }

  @override
  void onReady() async {
    await _fetchLastLoginDetail();
    super.onReady();
  }

  int generateRandomNumber() {
    int val = Random().nextInt(90000) + 10000;
    return val;
  }

  Future<void> _fetchLastLoginDetail() async {
    QuerySnapshot snapshot = await LoginDetail.collection
        .orderBy("date", descending: true)
        .limit(1)
        .get();
    if (snapshot.docs.isNotEmpty) {
      lastLoginDetail.value = LoginDetail.fromJson(snapshot.docs.first.data()!);
    } else {
      lastLoginDetail.value = null;
    }
  }

  Future<void> onPressedSave() async {
    loginDetail.qrImageUrl = await uploadQr();
    await LoginDetail.collection
        .doc(loginDetail.id)
        .set(loginDetail.toJson())
        .whenComplete(() => print("Updated in Firestore"));
  }

  Future<String?> uploadQr() async {
    final a = await qrPainter.toImageData(150);
    if (a == null) return null;
    String fileName = "${loginDetail.date!.millisecondsSinceEpoch}.jpeg";
    TaskSnapshot snapshot = await LoginDetail.storagePath
        .child(fileName)
        .putData(a.buffer.asUint8List(),
            SettableMetadata(contentType: "image/jpeg"));
    return snapshot.ref.getDownloadURL();
  }
}
