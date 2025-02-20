import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_qr_generation_example_app/utils/date_util.dart';

class LoginDetail {
  late String id;
  String? ip;
  String? location;
  DateTime? date;
  String? qrImageUrl;

  LoginDetail({
    this.ip,
    this.location,
    this.date,
    this.qrImageUrl,
  }) : id = collection.doc().id;

  LoginDetail.fromJson(Object data) {
    final json = data as Map<String, dynamic>;
    id = json["id"];
    ip = json["ip"];
    location = json["location"];
    date = DateUtil.timestampToDateTime(json["date"]);
    qrImageUrl = json["qr_image_url"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["id"] = id;
    data["ip"] = ip;
    data["location"] = location;
    data["date"] = DateUtil.dateTimeToTimestamp(date);
    data["qr_image_url"] = qrImageUrl;
    return data;
  }

  static CollectionReference get collection => FirebaseFirestore.instance
      .collection("ExampleApps")
      .doc("FlutterQrGenerationExample")
      .collection("LoginDetails");

  static Reference get storagePath =>
      FirebaseStorage.instance.ref("ExampleApps/FlutterQrGenerationExample");
}
