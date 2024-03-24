import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class BottomBarProduct extends StatelessWidget {
  const BottomBarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          color: Colors.transparent,
          height: 60,
          child: Row(
            children: [
              Column(
                children: [
                  CustomText(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    text: 'price',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      CustomText(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        text: '${Get.arguments['data'].price}',
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      CustomText(
                        text: 'EGP',
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  // controller.addProduct(cart_product_model(
                  //   image: Get.arguments['image'][0],
                  //   name: Get.arguments['brand'],
                  //   price: Get.arguments['price'],
                  //   id: Get.arguments['id'],
                  //   //  quantity: 1,
                  // ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 64,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'Add Cart',
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                              Icon(Icons.chevron_right_sharp)
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ));
  }
}