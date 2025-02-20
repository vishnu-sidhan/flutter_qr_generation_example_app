import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_qr_generation_example_app/models/login_detail.dart';
import 'package:get/get.dart';

class LoginDetailsController extends GetxController {
  final _today = DateTime.now();

  Future<List<LoginDetail>> fetchTodayLogin() => _fetchFromDB(
      from: DateTime(_today.year, _today.month, _today.day),
      to: DateTime(_today.year, _today.month, _today.day)
          .add(const Duration(days: 1)));

  Future<List<LoginDetail>> fetchYesterdayLogin() => _fetchFromDB(
      from: DateTime(_today.year, _today.month, _today.day)
          .subtract(const Duration(days: 1)),
      to: DateTime(_today.year, _today.month, _today.day));

  Future<List<LoginDetail>> fetchOthersLogin() => _fetchFromDB(
      from: DateTime(2024),
      to: DateTime(_today.year, _today.month, _today.day)
          .subtract(const Duration(days: 2)));

  Future<List<LoginDetail>> _fetchFromDB(
      {required DateTime from, required DateTime to}) async {
    List<LoginDetail> data = [];
    QuerySnapshot snapshot = await LoginDetail.collection
        .where("date", isGreaterThanOrEqualTo: from)
        .where("date", isLessThan: to)
        .get();
    if (snapshot.docs.isNotEmpty) {
      data = snapshot.docs.map((e) => LoginDetail.fromJson(e.data()!)).toList();
    }
    return data;
  }
}
