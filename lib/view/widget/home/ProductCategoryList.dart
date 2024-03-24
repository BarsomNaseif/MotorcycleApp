import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motorcycle_app/controller/categories_controller.dart';
import 'package:motorcycle_app/view/screen/categoriesdetails.dart';
import 'package:motorcycle_app/view/widget/CachedNetworkImage.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class ProductCategoryList extends StatelessWidget {
  const ProductCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return GetBuilder<CategoriesController>(builder: (controller) {
      return SizedBox(
          height: 120,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.productList.length,
              itemBuilder: (context, index) => Container(
                    //   color: Colors.amber,
                    margin: EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Get.to(CategoriesDetails(), arguments: {
                          "subcategory":
                              controller.productList[index].subcategory,
                        });
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 34.0,
                                  backgroundColor:
                                      Color.fromARGB(255, 110, 100, 100),
                                  child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Colors.white,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: WidgetCachedNetworkImage(
                                            imageUrl: controller
                                                .productList[index].image!),
                                      ))),
                            ],
                          ),
                          Text(
                            controller.productList[index].name!,
                            style: GoogleFonts.abel(
                                color: Colors.black, fontSize: 20),
                          ),
                          // CustomText(
                          //   text: controller.productList[index].name!,
                          //   fontSize: 17,
                          //   color: Colors.black,
                          //   fontWeight: FontWeight.w600,
                          // ),
                        ],
                      ),
                    ),
                  )));
    });
  }
}
