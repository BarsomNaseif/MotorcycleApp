import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:motorcycle_app/view/widget/CachedNetworkImage.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/home_controller.dart';

// ignore: must_be_immutable
class ImageCarousel extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    HomeController homeController = Get.put(HomeController());

    return GetBuilder<HomeController>(
      init:HomeController() ,
      builder: (controller) => 
       ClipRect(
        child: ((CarouselSlider(
            items: controller.Ads[0].image!
                .map<Widget>((item) => Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(1),
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: WidgetCachedNetworkImage(
                            imageUrl: item, fit: BoxFit.fitWidth),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayInFiniteScroll: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              height: 150,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              pauseAutoPlayOnTouch: false,
              viewportFraction: 1,
            )))),
      ),
    );
    
  }
}
