import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motorcycle_app/controller/categories_controller.dart';
import 'package:motorcycle_app/controller/home_controller.dart';
import 'package:motorcycle_app/core/themes/fonts_app.dart';
import 'package:motorcycle_app/view/screen/productdetails_screen.dart';
import 'package:motorcycle_app/view/screen/viewall_screen.dart';
import 'package:motorcycle_app/view/widget/home/CardMost.dart';
import 'package:motorcycle_app/view/widget/home/CardNewModel.dart';
import 'package:motorcycle_app/view/widget/home/CategoryHeader.dart';
import 'package:motorcycle_app/view/widget/home/ImageCarousel.dart';
import 'package:motorcycle_app/view/widget/home/ProductCategoryList.dart';
import 'package:motorcycle_app/view/widget/home/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
        
        body: GetBuilder<CategoriesController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SearchItems(),
                  CategoryHeader(
                      text: 'Categories',
                      onPressed: () {
                        // Get.to(viewall(), arguments: {
                        //   "data": "",
                        // });
                      }),
                  Obx(() {
                    return controller.isLoading.value
                        ? CircularProgressIndicator()
                        : ProductCategoryList();
                  }),
                  ImageCarousel(),
                  CategoryHeader(
                    text: 'Most Popular',
                    onPressed: () {
                      Get.to(viewall(), arguments: {
                        "data": homeController.mostPopular,
                        "title": "Most Popular"
                      });
                    },
                  ),
                  SizedBox(
                      height: 190,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.mostPopular.length,
                        itemBuilder: (context, index) {
                          var _most = homeController.mostPopular[index];
                          return InkWell(
                              onTap: () {
                                Get.to(ProductDetailsView(),
                                    arguments: {'data': _most});
                              },
                              child: BikeCardMost(
                                brand: _most.brand!,
                                image: _most.image![0],
                                price: _most.price!,
                                rating: 3.5,
                              ));
                        },
                      )),
                  CategoryHeader(
                    text: 'NewModel',
                    onPressed: () {
                      Get.to(viewall(), arguments: {
                        "data": homeController.newmodel,
                        "title": "NewModel"
                      });
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: homeController.newmodel.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        var _newmodel = homeController.newmodel[index];
                        return InkWell(
                          onTap: () {
                            Get.to(ProductDetailsView(),
                                arguments: {'data': _newmodel});
                          },
                          child: BikeCardNewModel(
                            brand: _newmodel.brand!,
                            image: _newmodel.image![0],
                            price: _newmodel.price!,
                            rating: 3.5,
                          ),
                        );
                      }),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
