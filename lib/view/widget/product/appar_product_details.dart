import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApparProductDetiles extends StatelessWidget {
  const ApparProductDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.red,
      width: width,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: 20,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          //   if (Get.arguments['engine'] == null)
          GestureDetector(
            child: Container(
              child: Stack(
                children: [
                  IconButton(
                    iconSize: 28,
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      // Get.to(Mycart());
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 9,
                      child: Text('1',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
