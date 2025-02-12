import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage/home_page.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final mobileNumber = TextEditingController();
  final otp = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final toLogin = false.obs;
  final resendOtpTimer = 0.obs;

  void onPressedButton() async {
    toLogin.value = true;
    otpTimer();
    User? user = await signIn(mobileNumber.value.text);
    if (user != null) Get.offAll(const HomePage());
  }

  void otpTimer() {
    resendOtpTimer.value = 60;
    Timer(const Duration(seconds: 1), () {
      if (resendOtpTimer.value > 0) {
        resendOtpTimer.value--;
        otpTimer();
      }
    });
  }

  Future<User?> signIn(String number, {int? resendToken}) async {
    String? verifyId;
    int? rToken;
    User? user;

    try {
      if (kIsWeb) {
        ConfirmationResult confirmationResult =
            await _auth.signInWithPhoneNumber(number);
        if (otp.text != "") {
          var a = (await confirmationResult.confirm(otp.text));
          user = a.user;
        }
      } else {
        await _auth.verifyPhoneNumber(
          phoneNumber: number,
          forceResendingToken: resendToken,
          verificationCompleted: (PhoneAuthCredential credential) async {
            var a = await _auth.signInWithCredential(credential);
            user = a.user;
          },
          verificationFailed: (FirebaseAuthException e) {
            debugPrint(e.code);
          },
          codeSent: (String verificationId, int? resendTokenId) async {
            // Code to Check
            if (verifyId != verificationId) {
              verifyId = verificationId;
            } // End
            rToken = resendTokenId;
            if (otp.text != "") {
              PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: otp.text);
            }
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verifyId = verificationId;
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
    return user;
  }
}
