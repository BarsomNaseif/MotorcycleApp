import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/homescreen_controller.dart';
import 'package:motorcycle_app/view/widget/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (controller) => Container(
          height: 60.0, // Adjust the height as needed
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(controller.listPage.length, ((i) {
                return CustomButtonAppBar(
                    textbutton: controller.titlebottomappbar[i],
                    icondata: controller.iconbottomappbar[i],
                    onPressed: () {
                      controller.changePage(i);
                    },
                    active: controller.currentpage == i ? true : false);
              }))
            ],
          ),
        ));
  }
}
