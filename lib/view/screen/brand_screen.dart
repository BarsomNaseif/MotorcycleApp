import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/categories_controller.dart';
import 'package:motorcycle_app/view/screen/brand_details.dart';
import 'package:motorcycle_app/view/widget/CachedNetworkImage.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class brsndScreen extends StatelessWidget {
  const brsndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController controller = Get.put(CategoriesController());
    return Scaffold(body: Obx(
      () {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : GetBuilder<CategoriesController>(
                builder: (controller) => GridView.builder(
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.brandList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            mainAxisExtent: 90,
                            childAspectRatio: 3 / 3.70,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.to(brand_details(), arguments: {
                              "namebrand": controller.brandList[index].name,
                              "items": controller.brandList[index].items,
                            });

                            print(index);
                          },
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: WidgetCachedNetworkImage(
                                      imageUrl:
                                          controller.brandList[index].image!,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: 30,
                                    width: double.infinity,
                                    //  color: Colors.blue,
                                    child: CustomText(
                                      text: controller.brandList[index].name!,
                                      alignment: Alignment.center,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          ),
                        )));
      },
    ));
  }
}
