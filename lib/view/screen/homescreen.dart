import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/homescreen_controller.dart';

import 'package:motorcycle_app/view/widget/custombottomappbarhome.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScareen extends StatelessWidget {
  const HomeScareen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());

    return GetBuilder<HomeScreenController>(
        builder: (controller) => Scaffold(
              //   backgroundColor: Colors.amber,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Motorcycle',
                    style: GoogleFonts.blackOpsOne(
                        color: Colors.black, fontSize: 25),
                  ),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                  )
                ],
              ),

              extendBody: true,
              //  extendBodyBehindAppBar: false,
              bottomNavigationBar: CustomBottomAppBarHome(),

              body: WillPopScope(
                  onWillPop: () {
                    Get.defaultDialog(
                        title: 'warning',
                        middleText: 'do you want to exit the app',
                        onCancel: () {},
                        onConfirm: () {
                          exit(0);
                        });
                    return Future.value(false);
                  },
                  child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}
