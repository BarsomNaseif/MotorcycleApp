import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';
import 'package:motorcycle_app/view/widget/home/CardNewModel.dart';

class viewall extends StatelessWidget {
  const viewall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: Get.arguments['title'],
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: Get.arguments['data'].length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            var data = Get.arguments['data'][index];
            return GestureDetector(
              child: BikeCardNewModel(
                brand: data.brand,
                image: data.image[0],
                price: data.price,
                rating: 3.5,
              ),
            );
          }),
          separatorBuilder: (BuildContext context, int index) => SizedBox(),
        ));
  }
}
