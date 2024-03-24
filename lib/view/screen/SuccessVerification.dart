import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/routes.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class SuccessVerification extends StatelessWidget {
  const SuccessVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 100,
          ),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.task_alt,
              size: 55,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomText(
            alignment: Alignment.center,
            text: 'Thank You! ',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black,
          ),
          CustomText(
            alignment: Alignment.center,
            text: 'Verification successful! ',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: CustomText(
              alignment: Alignment.center,
              text:
                  'Welcome to the Motorcycle app. Enjoy our services and be part of a great experience. ',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 7.0,
                  textStyle: const TextStyle(color: Colors.white)),
              onPressed: () {
                Get.toNamed(AppRoute.homescreen);
              },
              child: Text('Go to Motorcycle app ')),
          // CustomText(
          //   alignment: Alignment.center,
          //   text: 'Welcome to the Motorcycle app! ',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 20,
          //   color: Colors.black,
          // ),
          //  CustomText(
          //   alignment: Alignment.center,
          //   text: 'Enjoy a unique experience with us where you can explore the world of motorcycles with ease and fun.',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 20,
          //   color: Colors.black,
          // ),
        ]),
      ),
    );
  }
}
