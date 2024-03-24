import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:motorcycle_app/routes.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  void Login() async {
    if (formstate.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        Get.toNamed(AppRoute.homescreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.defaultDialog(
              title: "ُWarning", middleText: "No user found for that email.");
        } else if (e.code == 'wrong-password') {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: 'Wrong password provided for that user.');
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
