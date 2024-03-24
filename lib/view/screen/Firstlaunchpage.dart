import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/core/themes/images_app.dart';
import 'package:motorcycle_app/routes.dart';
import 'package:motorcycle_app/view/widget/authentication/LoginandSignupWidget.dart';

class Firstlaunchpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   //SignUpController controller=  Get.put(SignUpController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              ImageApp.back,
            ),
          ),
        ),
        child: Stack(
          children: [
            LoginSignupWidget(
              onTaplogin: () {
                Get.toNamed(AppRoute.LoginCardWidget,);
              },
            )
          ],
        ),
      ),
    );
  }
}
