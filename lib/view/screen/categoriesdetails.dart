import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motorcycle_app/controller/categories_controller.dart';
import 'package:motorcycle_app/view/widget/CachedNetworkImage.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class CategoriesDetails extends StatelessWidget {
  const CategoriesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<CategoriesController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: Get.arguments['subcategory'].length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 220,
                  childAspectRatio: 3 / 3.70,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) => Container(
                child: GestureDetector(
                  onTap: () async {
                    //  Get.back();
                    print(Get.arguments['subcategory'][index].brand);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor('#1E1E1E'),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: WidgetCachedNetworkImage(
                                  width: 150,
                                  imageUrl:
                                      'https://th.bing.com/th/id/OSK.HEROR6kkrbkNj6ZwkLHXLtdeEKhnJtob62kptUuiPP-pItU?rs=1&pid=ImgDetMain',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            padding: EdgeInsets.only(left: 15),
                            overflow: TextOverflow.ellipsis,
                            text: Get.arguments['subcategory'][index].brand,
                            alignment: Alignment.centerLeft,
                            fontSize: 18,
                            maxLines: 1,
                            color: HexColor('FFFFFF'),
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              CustomText(
                                padding: const EdgeInsets.only(left: 15),
                                text: '\$',
                                alignment: Alignment.centerLeft,
                                fontSize: 14,
                                color: HexColor("B87651"),
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                overflow: TextOverflow.ellipsis,
                                text: '',
                                alignment: Alignment.centerLeft,
                                fontSize: 14,
                                maxLines: 1,
                                color: Color(0xFF8A8886),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
