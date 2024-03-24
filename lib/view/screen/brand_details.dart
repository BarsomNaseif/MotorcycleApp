import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/view/screen/productdetails_screen.dart';
import 'package:motorcycle_app/view/widget/home/CardNewModel.dart';

class brand_details extends StatelessWidget {
  const brand_details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['namebrand']),
      ),
      body: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: Get.arguments['items'].length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(ProductDetailsView(),
                            //arguments: {'data': _newmodel}
                            );
                      },
                    child: BikeCardNewModel(
                      brand: Get.arguments['items'][index].brand,
                      image:
                          'https://th.bing.com/th/id/OSK.HEROR6kkrbkNj6ZwkLHXLtdeEKhnJtob62kptUuiPP-pItU?rs=1&pid=ImgDetMain',
                      price: '123456',
                      rating: 3.5,
                    ),
                  );
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(),
              )
    );
  }
}