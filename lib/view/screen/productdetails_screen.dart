import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/view/widget/product/ProductTitleWidget.dart';
import 'package:motorcycle_app/view/widget/product/bottomBar_product.dart';
import 'package:motorcycle_app/view/widget/product/cart_product_detail.dart';
import 'package:motorcycle_app/view/widget/product/actionsrow_product_details.dart';
import 'package:motorcycle_app/view/widget/product/appar_product_details.dart';
import 'package:motorcycle_app/view/widget/product/ProductImageCarousel.dart';

class ProductDetailsView extends StatelessWidget {
  //DetalesMotoCard({super.key, this.sizelength});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar:BottomBarProduct(),
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ListView(children: [
          const ApparProductDetiles(),
          const ProductTitleWidget(),
          const ProductImageCarousel(),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.black,
              ),
              child: Column(
                children: [
                 ProductActionsRow(),
                  SizedBox(
                    height: 15,
                  ),
                  // Get.arguments['engine'] == null
                  //     ? detail_view_Categores(
                  //         context,
                  //         widget.sizelength,
                  //       )
                  CartProductDetail(
                      Engine: Get.arguments['data'].engine,
                      HorsePower: Get.arguments['data'].horse,
                      MaxSpeed: Get.arguments['data'].speed,
                      Tank: Get.arguments['data'].tank,
                      Videoreview: Get.arguments['data'].videoreview,
                      ViewSpecsDetails:
                          Get.arguments['data'].viewSpecsDetails,
                      model: Get.arguments['data'].model),
                ],
              )),
        ]),
      ),
    );
  }
}
